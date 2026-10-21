CREATE TABLE IF NOT EXISTS pacientes (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  documento VARCHAR(10) UNIQUE NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  correo VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS medicos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS citas (
  id SERIAL PRIMARY KEY,
  paciente_id INT NOT NULL REFERENCES pacientes(id),
  medico_id INT NOT NULL REFERENCES medicos(id),
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  UNIQUE (medico_id, fecha, hora)  -- evita dos citas del mismo médico a la misma hora
);

INSERT INTO pacientes (nombre, documento, telefono, correo) VALUES
 ('Carlos Pérez','1010101010','3001234567','carlos@correo.com'),
 ('Ana Torres','1020202020','3009876543','ana@correo.com');
INSERT INTO medicos (nombre, especialidad) VALUES
 ('Dra. Laura Gómez','Medicina general'),
 ('Dr. Andrés Ruiz','Pediatría');
INSERT INTO citas (paciente_id, medico_id, fecha, hora) VALUES
 (1,1,CURRENT_DATE+1,'08:00'),
 (2,1,CURRENT_DATE+1,'08:30'),
 (1,2,CURRENT_DATE+2,'10:00');
