# Рассмотрим такую ситуацию: есть некий базовый класс Operation, у которого есть два наследника — Goal и Task.
# Все три класса имеют некий схожий функционал, они могут сформировывать некий сложный объект:

module BadCode
  class Operation
    def return_operation
      operation = {
        :goal => {:id => goal.gid, :title  => goal.title, :ts => goal.ts},
        :task => {:is_problem => task.is_problem, :state => task.state,:author => task.author_id}
      }
      return operation
    end
  end

  class Goal < Operation
    def return_operation
      operation = {
        :goal =>  {:id => goal.gid, :title => goal.title, :ts => goal.ts,  :author  => goal..author_id, :holder  => complect_goal_content_header},
        :task => {:is_problem => task.is_problem, :state => task.state,:author => task.author_id}
      }
      return operation
    end
  end

  class Task < Operation
    def return_operation
      operation = {
        :goal => {:id => goal.gid, :title  => goal.title, :ts => goal.ts},
        :task =>  {:id  => task.gid, :title => task.title,  :ts  => task.ts, :author  => task..author_id, :holder => complect_holder}
      }
      }
      return operation
    end
  end
end

# Тут мы опять видим дублирование кода(Например, смотрим на ключ goal в Task и Operation).
# Функционал метода return_operation «мутирует» в каждом классе иерархии, но ключи(goal и task) всегда остаются неизменными.
# Для разрешения такого рода ситуаций лучше всего подходит паттерн «Шаблонный метод».
# Смысл шаблона в том, что он дает возможность определить основу алгоритма,
# позволяя наследникам переопределять некоторые шаги алгоритма, не изменяя его структуру в целом.
# В нашем случае реализация шаблона будет выглядеть примерно так:

module GoodCode
  class Operation
    def return_operation
      operation = {
        :goal => complect_goal,
        :task => complect_task
      }
      return operation
    end

    def complect_goal
      goal_obj = {
        :id => goal.gid,
        :title => goal.title,
        :ts => goal.ts,
      }
      return goal_obj
    end

    def complect_task
      #task = self.task
      task_obj = {
        :is_problem =>task.is_problem,
        :state => task.state,
        :author => task.author_id
      }
      return task_obj
    end
  end

  class Event < Operation
    def complect_goal
      goal_obj = {
        :id         => goal.gid,
        :title      => goal.title,
        :ts         => goal.ts,
        :author     => goal.author_id,
        :holder     => complect_goal_content_header
      }
      return goal_obj
    end
  end

  class Task < Operation
    def complect_task
      task_obj = {
        :id         => task.gid,
        :title      => task.title,
        :ts         => task.ts,
        :author     => task.author_id,
        :holder     =>  complect_holder
      }
      return task_obj
    end
  end
end