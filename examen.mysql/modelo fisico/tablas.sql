CREATE DATABASE IF NOT EXISTS examen;
USE examen;
 
-- Tabla base de Personas (Herencia / Personal)
CREATE TABLE persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni_nif VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
) ENGINE=InnoDB;

-- Especialidades Médicas
CREATE TABLE especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Médicos (Extensión de Persona)
CREATE TABLE medico (
    id_medico INT PRIMARY KEY,
    tipo ENUM('titular', 'interino', 'sustituto') NOT NULL,
    id_especialidad INT NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
) ENGINE=InnoDB;

-- Empleados No Médicos
CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    tipo_empleado ENUM('ATS', 'auxiliar_enfermeria', 'celador', 'administrativo') NOT NULL,
    id_supervisore INT NULL,
    FOREIGN KEY (id_empleado) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_supervisore) REFERENCES empleado(id_empleado)
) ENGINE=InnoDB;

-- Pacientes
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni_nif VARCHAR(20) UNIQUE NOT NULL,
    id_medico_asignado INT NOT NULL,
    FOREIGN KEY (id_medico_asignado) REFERENCES medico(id_medico)
) ENGINE=InnoDB;

-- Horarios de Consulta
CREATE TABLE horario_consulta (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    dia_semana ENUM('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Registro de Sustituciones
CREATE TABLE sustitucion (
    id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico_titular INT NOT NULL,
    id_medico_sustituto INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (id_medico_titular) REFERENCES medico(id_medico),
    FOREIGN KEY (id_medico_sustituto) REFERENCES medico(id_medico)
) ENGINE=InnoDB;

-- Control de Vacaciones
CREATE TABLE vacacion (
    id_vacacion INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('planificada', 'disfrutada') NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Atenciones / Citas Realizadas
CREATE TABLE atencion_medica (
    id_atencion INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_atencion DATETIME NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
) ENGINE=InnoDB;

