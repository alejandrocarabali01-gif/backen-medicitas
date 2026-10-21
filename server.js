import 'dotenv/config';
import express from 'express';
import cors from 'cors';
import pg from 'pg';

const app = express();
app.use(cors({ origin: process.env.FRONTEND_URL || '*' }));

const pool = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false },
});

app.get('/', (_req, res) => res.json({ servicio: 'MediCitas API', estado: 'activo' }));

app.get('/api/citas', async (_req, res) => {
  try {
    const { rows } = await pool.query(`
      SELECT c.id,
             to_char(c.fecha, 'YYYY-MM-DD') AS fecha,
             to_char(c.hora, 'HH24:MI') AS hora,
             p.nombre AS paciente,
             m.nombre AS medico,
             m.especialidad
      FROM citas c
      JOIN pacientes p ON p.id = c.paciente_id
      JOIN medicos m ON m.id = c.medico_id
      ORDER BY c.fecha, c.hora`);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'No pudimos cargar las citas. Intenta de nuevo en un momento.' });
  }
});

app.listen(process.env.PORT || 3000, () => console.log('API de MediCitas lista'));
