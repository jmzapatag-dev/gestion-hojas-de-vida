```mermaid
erDiagram
    STUDENTS {
      int student_id PK
      string first_name
      string last_name
      date dob
      string gender
      string email
      string phone
      text address
    }
    DOCUMENTS {
      int document_id PK
      int student_id FK
      string doc_type
      string filename
      string filepath
    }
    MEDICAL_INFO {
      int med_id PK
      int student_id FK
      string blood_type
      text allergies
      text chronic_conditions
      string emergency_contact
      string emergency_phone
    }
    COURSES {
      int course_id PK
      string code
      string name
      int credits
    }
    ENROLLMENTS {
      int enrollment_id PK
      int student_id FK
      int course_id FK
      string term
    }
    GRADES {
      int grade_id PK
      int enrollment_id FK
      decimal grade
      string grade_type
    }
    COMMENTS {
      int comment_id PK
      int student_id FK
      string author
      text content
      datetime created_at
    }

    STUDENTS ||--o{ DOCUMENTS : tiene
    STUDENTS ||--o{ MEDICAL_INFO : registra
    STUDENTS ||--o{ ENROLLMENTS : inscribe
    COURSES ||--o{ ENROLLMENTS : contiene
    ENROLLMENTS ||--o{ GRADES : registra
    STUDENTS ||--o{ COMMENTS : recibe
