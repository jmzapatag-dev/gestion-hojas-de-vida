-- ================================================
-- BASE DE DATOS: Gestión de Hojas de Vida Estudiantes
-- Modelo SQL 1:1 con diagrama Mermaid
-- ================================================

DROP DATABASE IF EXISTS gestion_hojas_vida;
CREATE DATABASE gestion_hojas_vida;
USE gestion_hojas_vida;

-- ================================================
-- TABLA: STUDENTS
-- ================================================
CREATE TABLE STUDENTS (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- ================================================
-- TABLA: DOCUMENTS
-- ================================================
CREATE TABLE DOCUMENTS (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    doc_type VARCHAR(50),
    filename VARCHAR(255),
    filepath VARCHAR(255),
    CONSTRAINT fk_documents_students
        FOREIGN KEY (student_id)
        REFERENCES STUDENTS(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================================
-- TABLA: MEDICAL_INFO
-- ================================================
CREATE TABLE MEDICAL_INFO (
    med_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    blood_type VARCHAR(5),
    allergies TEXT,
    chronic_conditions TEXT,
    emergency_contact VARCHAR(100),
    emergency_phone VARCHAR(20),
    CONSTRAINT fk_medicalinfo_students
        FOREIGN KEY (student_id)
        REFERENCES STUDENTS(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================================
-- TABLA: COURSES
-- ================================================
CREATE TABLE COURSES (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits >= 0)
);

-- ================================================
-- TABLA: ENROLLMENTS
-- ================================================
CREATE TABLE ENROLLMENTS (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    term VARCHAR(20),
    CONSTRAINT fk_enrollments_students
        FOREIGN KEY (student_id)
        REFERENCES STUDENTS(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_enrollments_courses
        FOREIGN KEY (course_id)
        REFERENCES COURSES(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================================
-- TABLA: GRADES
-- ================================================
CREATE TABLE GRADES (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    grade DECIMAL(5,2) CHECK (grade >= 0 AND grade <= 100),
    grade_type VARCHAR(50),
    CONSTRAINT fk_grades_enrollments
        FOREIGN KEY (enrollment_id)
        REFERENCES ENROLLMENTS(enrollment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================================
-- TABLA: COMMENTS
-- ================================================
CREATE TABLE COMMENTS (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    author VARCHAR(100),
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comments_students
        FOREIGN KEY (student_id)
        REFERENCES STUDENTS(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
