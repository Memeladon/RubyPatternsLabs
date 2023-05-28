# Представим, что Вас посадили на проект и Вы пытаетесь читать чужой код. Видим строчки:
module BadCode
  LogRec.create(uid: task[:tid], lrtype: 'tsk', rc_time: rc_time, start: task[:start] )
  # Читаем код дальше
  LogRec.create(uid: task[:tid], lrtype: 'task', rc_time: rc_time, start: task[:start] )
end
# Странно, там 'tks', тут 'task'. Ок, посмотрели в документацию, в миграции (еще куда — нибудь), исправили.
# Читаем дальше, опять ошибка… И так дальше..
# В данном случае лучше вcего использовать Enum'ы. В Ruby Enum он выглядит примерно так:

module ProtocolElementTypeName
  TASK  = 'task'
  NOTE  = 'note'
  EVENT = 'event'
end

# Тогда во всех Ваших контроллерах и моделях будет использоваться константа(ProtocolElementTypeName::TASK) и никаких опечаток!