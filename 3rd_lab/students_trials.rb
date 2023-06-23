require_relative '../2nd_lab/student'

module StudentsTrials
  STUDENT1 = Student.new(id:1, surname:'Pozov', name:'Dmitry', patronymic:'Temurovich',  git:'https://github.com/username/pozov')
  STUDENT1.set_contacts( phone:'8-800-555-35-35', telegram: '@pozovvv')

  STUDENT2 = Student.new(id:2, surname:'Shastoon', name:'Anton', patronymic:'Andreevich', git:'https://github.com/username/shastoon')
  STUDENT2.set_contacts(phone: "8-922-057-39-42", telegram: "@shastoonnn", email: "shastoon@mail.com")

  STUDENT3 = Student.new(id:3, surname:'Popov', name:'Arseniy', patronymic:'Sergeevich', git:'https://github.com/username/popov')
  STUDENT3.set_contacts(phone: "8-918-356-23-47", telegram: "@popovvv", email: "popov@mail.com")

  STUDENT4 = Student.new(id:4, surname:'Ivanov', name:'Ivan', patronymic:'Ivanovich', git:'https://github.com/username/ivanov')
  STUDENT4.set_contacts(phone: "8-918-222-33-55", telegram: "@ivanov", email: "ivanov@mail.com")

  STUDENT5 = Student.new(id:4, surname:'Gracias', name:'Muchas', patronymic:'Senoras', git:'https://github.com/username/spanich')
  STUDENT5.set_contacts(phone: "8-10-34-93-123 45 67", telegram: "@muchas", email: "muchas@mail.com")
end
