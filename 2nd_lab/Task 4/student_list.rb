require_relative '../Task 3/data_list'
require 'json'
require 'yaml'
class Student_list
  attr_accessor :students
  def initialize(strategy)
    @strategy = strategy
  end

  # a. Метод чтения из файла
  def self.read_from_file
    @strategy.read_students
  end

  # b. Метод записи в файл
  def self.write_to_file(new_students)
    @strategy.save_students(new_students)
  end

  # c. Метод получения объекта Student по ID
  def self.get_student_by_id(students, id)
    students.each do |student|
      return student if student.id == id
    end
    nil
  end

  # d. Метод получения списка k по счету n объектов класса Student_short
  def get_k_n_student_short_list(k, n, data_list)
    sorted_data = sort_by_surname_initials(data_list.data)
    start_index = (k - 1) * n

    Data_list.new(sorted_data[start_index...start_index+n])
  end

  # e. Метод сортировки элементов по набору Фамилия - Инициалы.
  def sort_by_surname_initials(data)
    data.sort_by { |obj| obj.surname_initials }
  end

  # f. Метод добавления объекта Student в список
  def self.add_student(students, student)
    student.id = students.length + 1
    students << student
  end

  # g. Метод замены элемента списка по ID
  def self.replace_student_by_id(students, id, new_student)
    students.each_with_index do |student, index|
      if student.id == id
        new_student.id = id
        students[index] = new_student
        return
      end
    end
  end

  # h. Метод удаления элемента списка по ID
  def self.delete_student_by_id(students, id)
    students.each_with_index do |student, index|
      if student.id == id
        students.delete_at(index)
        return
      end
    end
  end

  # i. Метод получения количества элементов
  def get_student_short_count(data_list)
    data_list.data.length
  end

end
