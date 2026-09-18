# MediSistema

## Descripción

**MediSistema** es una base de datos creada en **MySQL** para gestionar la información de un centro de salud.

Permite almacenar información sobre:

* Médicos.
* Empleados.
* Pacientes.
* Horarios de consulta.
* Sustituciones.
* Vacaciones.

## Objetivo

Diseñar una base de datos que permita organizar y consultar fácilmente la información del personal médico, empleados y pacientes.

También permite controlar los horarios, vacaciones, sustituciones y médicos asignados a los pacientes.

## Tecnologías

* **MySQL:** Base de datos.
* **SQL:** Creación y consulta de información.
* **MySQL Workbench:** Diseño y administración de la base de datos.
* **GitHub:** Almacenamiento del proyecto.

## Estructura del proyecto

```text
MediSistema/
│
├── README.md
├── estructura.sql
├── datos.sql
├── consultas.sql
│
├── modelo/
│   ├── modelo-logico.png
│   └── modelo-fisico.png
│
└── evidencias/
```

## Instalación

1. Abrir **MySQL Workbench**.
2. Ejecutar el archivo `estructura.sql` para crear la base de datos y las tablas.
3. Ejecutar `datos.sql` para insertar los datos de prueba.
4. Ejecutar `consultas.sql` para realizar las consultas solicitadas.

## Modelo de la base de datos

El proyecto cuenta con un **modelo lógico y físico**, donde se representan las tablas, atributos, relaciones, claves primarias y claves foráneas.

**Modelo lógico:**
`[Agregar imagen o enlace]`

**Modelo físico:**
`[Agregar imagen o enlace]`

# Consultas

### 1. Número de pacientes atendidos por cada médico

```SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    COUNT(a.id_atencion) AS pacientes_atendidos
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
LEFT JOIN atencion_medica a ON m.id_medico = a.id_medico
GROUP BY m.id_medico, p.nombre, p.apellido;
```

### 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado

```SELECT 
    e.id_empleado,
    p.nombre,
    p.apellido,
    SUM(CASE 
        WHEN v.estado = 'planificada' 
        THEN DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1 
        ELSE 0 
    END) AS dias_planificados,
    SUM(CASE 
        WHEN v.estado = 'disfrutada' 
        THEN DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1 
        ELSE 0 
    END) AS dias_disfrutados
FROM empleado e
JOIN persona p ON e.id_empleado = p.id_persona
LEFT JOIN vacacion v ON e.id_empleado = v.id_persona
GROUP BY e.id_empleado, p.nombre, p.apellido;
```

### 3. Médicos con mayor cantidad de horas de consulta en la semana

```SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    SUM(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 
        AS horas_consulta_semana
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, p.nombre, p.apellido
ORDER BY horas_consulta_semana DESC;

```

### 4. Número de sustituciones realizadas por cada médico sustituto

```SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    COUNT(s.id_sustitucion) AS numero_sustituciones
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
LEFT JOIN sustitucion s 
    ON m.id_medico = s.id_medico_sustituto
GROUP BY m.id_medico, p.nombre, p.apellido;
```

### 5. Número de médicos que están actualmente en sustitución

```
SELECT COUNT(DISTINCT id_medico_titular) AS medicos_en_sustitucion
FROM sustitucion
WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin;
```

### 6. Horas totales de consulta por médico por día de la semana

```SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    h.dia_semana,
    SUM(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 
        AS horas_totales
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY 
    m.id_medico,
    p.nombre,
    p.apellido,
    h.dia_semana
ORDER BY m.id_medico;
```

### 7. Médico con mayor cantidad de pacientes asignados

```SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    COUNT(pa.id_paciente) AS pacientes_asignados
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
LEFT JOIN paciente pa ON m.id_medico = pa.id_medico_asignado
GROUP BY m.id_medico, p.nombre, p.apellido
ORDER BY pacientes_asignados DESC
LIMIT 1;

```

### 8. Empleados con más de 10 días de vacaciones disfrutadas

```SELECT 
    e.id_empleado,
    p.nombre,
    p.apellido,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1) AS dias_disfrutados
FROM empleado e
JOIN persona p ON e.id_empleado = p.id_persona
JOIN vacacion v ON e.id_empleado = v.id_persona
WHERE v.estado = 'disfrutada'
GROUP BY e.id_empleado, p.nombre, p.apellido
HAVING dias_disfrutados >= 10;
```

### 9. Médicos que actualmente están realizando una sustitución

```SELECT DISTINCT
    m.id_medico,
    p.nombre,
    p.apellido
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN sustitucion s ON m.id_medico = s.id_medico_sustituto
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;
```

### 10. Promedio de horas de consulta por médico por día de la semana

``` m.id_medico,
    p.nombre,
    p.apellido,
    h.dia_semana,
    AVG(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 
        AS promedio_horas
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY 
    m.id_medico,
    p.nombre,
    p.apellido,
    h.dia_semana;
```

## Evidencias

En las carpetas se encuentran las capturas del funcionamiento de la base de datos, creación de tablas, inserción de datos y consultas.

## Repositorio


## Conclusión

MediSistema permite organizar la información de un centro de salud mediante una base de datos relacional en MySQL, facilitando la gestión de médicos, empleados, pacientes, horarios, vacaciones y sustituciones.
