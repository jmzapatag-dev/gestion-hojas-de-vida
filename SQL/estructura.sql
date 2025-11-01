-- ============================================
-- ESTRUCTURA BASE DE DATOS: GESTIÓN HOJAS DE VIDA
-- ============================================

CREATE DATABASE IF NOT EXISTS gestion_hojas_de_vida;
USE gestion_hojas_de_vida;

-- =======================
-- TABLA: ESTUDIANTES
-- =======================
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(150) UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    tipo_sangre VARCHAR(5),
    alergias TEXT,
    condiciones_cronicas TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =======================
-- TABLA: DOCUMENTOS
-- =======================
CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    tipo_documento VARCHAR(50),
    nombre_archivo VARCHAR(200),
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)
);

-- =======================
-- TABLA: COMENTARIOS
-- =======================
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    autor VARCHAR(100),
    contenido TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)
);

-- =======================
-- TABLA: INSCRIPCIONES
-- =======================
CREATE TABLE inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    codigo_curso VARCHAR(50),
    periodo VARCHAR(20),
    nota DECIMAL(5,2),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)
);
