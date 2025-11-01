```markdown
```mermaid
classDiagram
    class Student {
      _id
      first_name
      last_name
      dob
      email
      phone
      address
      medical : { blood_type, allergies[], chronic_conditions[] }
      documents[] : [ { doc_id, doc_type, filename, uploaded_at } ]
      comments[] : [ { author, content, created_at } ]
      enrollments[] : [ { course_code, term, grades[] } ]
      created_at
    }