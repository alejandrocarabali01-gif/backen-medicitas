# MediCitas – Backend
API en Node.js + Express conectada a PostgreSQL en la nube.

- `GET /` estado del servicio
- `GET /api/citas` lista de citas con paciente y médico

## Uso local
1. Crea las tablas ejecutando `schema.sql` en tu base de datos (Supabase o Neon).
2. Copia `.env.example` a `.env` y completa `DATABASE_URL`.
3. `npm install` y `npm start`.

## Despliegue (Render)
Web Service → Build: `npm install` → Start: `npm start` → variables `DATABASE_URL` y `FRONTEND_URL`.
