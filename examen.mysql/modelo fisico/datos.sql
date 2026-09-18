USE examen;


-- =========================================
-- 1. ESPECIALIDADES
-- =========================================

INSERT INTO especialidad (nombre) VALUES
('Medicina General'),
('Cardiologia'),
('Pediatria'),
('Dermatologia'),
('Traumatologia'),
('Ginecologia');


-- =========================================
-- 2. PERSONAS
-- =========================================

INSERT INTO persona (nombre, apellido, dni_nif, telefono, email) VALUES
('Carlos', 'Martinez', '1001001001', '3001112233', 'carlos.martinez@gmail.com'),
('Ana', 'Rodriguez', '1001001002', '3002223344', 'ana.rodriguez@gmail.com'),
('Luis', 'Gomez', '1001001003', '3003334455', 'luis.gomez@gmail.com'),
('Maria', 'Lopez', '1001001004', '3004445566', 'maria.lopez@gmail.com'),
('Juan', 'Perez', '1001001005', '3005556677', 'juan.perez@gmail.com'),
('Laura', 'Torres', '1001001006', '3006667788', 'laura.torres@gmail.com'),
('Pedro', 'Ramirez', '1001001007', '3007778899', 'pedro.ramirez@gmail.com'),
('Sofia', 'Hernandez', '1001001008', '3008889900', 'sofia.hernandez@gmail.com'),
('Diego', 'Castro', '1001001009', '3009990011', 'diego.castro@gmail.com'),
('Valentina', 'Moreno', '1001001010', '3011112233', 'valentina.moreno@gmail.com'),
('Andres', 'Vargas', '1001001011', '3012223344', 'andres.vargas@gmail.com'),
('Camila', 'Rojas', '1001001012', '3013334455', 'camila.rojas@gmail.com');


-- =========================================
-- 3. MEDICOS
-- =========================================

INSERT INTO medico (id_medico, tipo, id_especialidad) VALUES
(1, 'titular', 1),
(2, 'titular', 2),
(3, 'interino', 3),
(4, 'titular', 4),
(5, 'sustituto', 5),
(6, 'interino', 6);


-- =========================================
-- 4. EMPLEADOS NO MEDICOS
-- =========================================

INSERT INTO empleado (id_empleado, tipo_empleado, id_supervisore) VALUES
(7, 'ATS', NULL),
(8, 'auxiliar_enfermeria', 7),
(9, 'celador', 7),
(10, 'administrativo', NULL),
(11, 'ATS', 7),
(12, 'auxiliar_enfermeria', 7);


-- =========================================
-- 5. PACIENTES
-- =========================================

INSERT INTO paciente 
(nombre, apellido, dni_nif, id_medico_asignado) VALUES
('Daniel', 'Suarez', '2002002001', 1),
('Paula', 'Mendoza', '2002002002', 2),
('Miguel', 'Jimenez', '2002002003', 3),
('Natalia', 'Ruiz', '2002002004', 4),
('Sebastian', 'Ortiz', '2002002005', 1),
('Isabella', 'Navarro', '2002002006', 2),
('Mateo', 'Silva', '2002002007', 3),
('Gabriela', 'Molina', '2002002008', 4),
('Alejandro', 'Cortes', '2002002009', 5),
('Mariana', 'Pineda', '2002002010', 6);


-- =========================================
-- 6. HORARIOS DE CONSULTA
-- =========================================

INSERT INTO horario_consulta 
(id_medico, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'Lunes', '08:00:00', '12:00:00'),
(1, 'Martes', '08:00:00', '12:00:00'),
(1, 'Miercoles', '08:00:00', '12:00:00'),
(1, 'Jueves', '08:00:00', '12:00:00'),
(1, 'Viernes', '08:00:00', '12:00:00'),
(1, 'sabdo', '08:00:00', '12:00:00'),
(1, 'domingo', '08:00:00', '12:00:00');


-- =========================================
-- 7. SUSTITUCIONES
-- =========================================

INSERT INTO sustitucion 
(id_medico_titular, id_medico_sustituto, fecha_inicio, fecha_fin) VALUES
(1, 5, '2026-10-01', '2026-10-15'),
(2, 5, '2026-11-03', '2026-11-10'),
(4, 5, '2026-12-01', '2026-12-15');


-- =========================================
-- 8. VACACIONES
-- =========================================

INSERT INTO vacacion 
(id_persona, fecha_inicio, fecha_fin, estado) VALUES
(1, '2026-07-01', '2026-07-10', 'disfrutada'),
(2, '2026-08-03', '2026-08-12', 'disfrutada'),
(3, '2026-09-15', '2026-09-20', 'planificada'),
(4, '2026-07-20', '2026-07-30', 'disfrutada'),
(5, '2026-10-05', '2026-10-15', 'planificada'),
(6, '2026-11-10', '2026-11-20', 'planificada'),
(7, '2026-06-01', '2026-06-10', 'disfrutada'),
(8, '2026-08-15', '2026-08-20', 'disfrutada'),
(9, '2026-09-01', '2026-09-05', 'disfrutada'),
(10, '2026-10-10', '2026-10-20', 'planificada'),
(11, '2026-07-05', '2026-07-12', 'disfrutada'),
(12, '2026-12-20', '2026-12-30', 'planificada');


-- =========================================
-- 9. ATENCIONES MEDICAS
-- =========================================

INSERT INTO atencion_medica 
(id_paciente, id_medico, fecha_atencion) VALUES
(1, 1, '2026-09-01 08:30:00'),
(2, 2, '2026-09-01 09:00:00'),
(3, 3, '2026-09-02 14:30:00'),
(4, 4, '2026-09-03 15:00:00'),
(5, 1, '2026-09-04 10:00:00'),
(6, 2, '2026-09-05 09:30:00'),
(7, 3, '2026-09-07 15:30:00'),
(8, 4, '2026-09-08 16:00:00'),
(9, 5, '2026-09-09 08:30:00'),
(10, 6, '2026-09-10 09:00:00'),
(1, 1, '2026-09-11 10:30:00'),
(3, 3, '2026-09-12 16:00:00');