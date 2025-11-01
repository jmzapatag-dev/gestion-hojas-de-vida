```mermaid
classDiagram
    class Student {
        +string _id
        +string first_name
        +string last_name
        +date dob
        +string email
        +string phone
        +string address
        +object medical
        +array documents
        +array comments
        +array enrollments
        +date created_at
    }

    class Medical {
        +string blood_type
        +array allergies
        +array chronic_conditions
    }

    class Document {
        +string doc_id
        +string doc_type
        +string filename
        +date uploaded_at
    }

    class Comment {
        +string author
        +string content
        +date created_at
    }

    class Enrollment {
        +string course_code
        +string term
        +array grades
    }

    %% Relaciones (embebidos)
    Student --> Medical : "1 a 1"
    Student --> Document : "1 a muchos"
    Student --> Comment : "1 a muchos"
    Student --> Enrollment : "1 a muchos"
