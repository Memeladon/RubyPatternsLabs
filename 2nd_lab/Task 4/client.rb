# frozen_string_literal: true

class Client
  def initialize(strategy)
    @strategy = strategy
  end

  def read_all_students
    @strategy.read_students
  end

  def save_students(new_students)
    @strategy.save_students(new_students)
  end
end
