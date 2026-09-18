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

```sql
```

### 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado

```sql
```

### 3. Médicos con mayor cantidad de horas de consulta en la semana

```sql
```

### 4. Número de sustituciones realizadas por cada médico sustituto

```sql
```

### 5. Número de médicos que están actualmente en sustitución

```sql
```

### 6. Horas totales de consulta por médico por día de la semana

```sql
```

### 7. Médico con mayor cantidad de pacientes asignados

```sql
```

### 8. Empleados con más de 10 días de vacaciones disfrutadas

```sql
```

### 9. Médicos que actualmente están realizando una sustitución

```sql
```

### 10. Promedio de horas de consulta por médico por día de la semana

```sql
```

## Evidencias

En la carpeta `evidencias` se encuentran las capturas del funcionamiento de la base de datos, creación de tablas, inserción de datos, consultas y modelos.

## Repositorio

**GitHub:**
`[Agregar enlace al repositorio]`

## Conclusión

MediSistema permite organizar la información de un centro de salud mediante una base de datos relacional en MySQL, facilitando la gestión de médicos, empleados, pacientes, horarios, vacaciones y sustituciones.
