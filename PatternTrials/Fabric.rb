# Воспользоваться шаблоном «Фабрика».
# Смысл данного шаблона в том, что он предоставляет удобный интерфейс для создания объекта нужного типа.

# Видим что-то Такое:
module BadCode
log = Array.new
  log_recs.each do |log_rec|
    case log_rec.lrtype
    when 'qc'
      log.push({uid: log_rec.uid, type: log_rec.lrtype, parid: log_rec.parid, start: log_rec.start.gsub(" ", "T"), ts: log_rec.ts.gsub(" ", "T"), rc_time: log_rec.rc_time.gsub(" ", "T"), state: log_rec.state, rcpt: log_rec.recipient})
    when 'tstate', 'etsks'
      log.push({type: log_rec.lrtype, parid: log_rec.parid, start: log_rec.start.gsub(" ", "T"), end: log_rec.end, ts: log_rec.ts.gsub(" ", "T"), rc_time: log_rec.rc_time.gsub(" ", "T"), state: log_rec.state, rcpt: log_rec.recipient})
    when 'pcb', 'grps'
      log.push({type: log_rec.lrtype, ts: log_rec.ts.gsub(" ", "T"), rc_time: log_rec.rc_time.gsub(" ", "T"), rcpt: log_rec.recipient})
    when 'egrp', 'tgrp'
      log.push({type: log_rec.lrtype, parid: log_rec.parid, ts: log_rec.ts.gsub(" ", "T"), rc_time: log_rec.rc_time.gsub(" ", "T"), state: log_rec.state, rcpt: log_rec.recipient})
    when 'rprefs'
      log.push({type: log_rec.lrtype, parid: log_rec.parid, ts: log_rec.ts.gsub(" ", "T"), rc_time: log_rec.rc_time.gsub(" ", "T"), rcpt: log_rec.recipient})
    else
      log.push({uid: log_rec.uid, type: log_rec.lrtype, parid: log_rec.parid, start: log_rec.start.gsub(" ", "T"), end: log_rec.end, ts: log_rec.ts.gsub(" ", "T"), rc_time: log_rec.rc_time.gsub(" ", "T"), state: log_rec.state, rcpt: log_rec.recipient})
    end
  end
end

# Итак, что мы видим из кода: в таблице есть много полей из которых могут «укомплектовываться» объекты разных типов.
# Тип объекта будет зависит от того, что записано в поле lrtype.
# Для начала создадим модуль, где перечислим все возможные значения поля lrtype:

module LogRecObjType # Значения для obj_type в таблице LogRec
  EVENT = 'event'
  QC = 'qv'
  TASK = 'task'
end

# Затем, надо создать Hash, который необходим для того, чтобы по значению lrtype создавать объект определенного типа:

@@types_objects = {
  ObjectJournal::QC => :complect_qc,
  ObjectJournal::EVENT => :complect_event,
  ObjectJournal::TASK => :complect_task
}

# И реализовать функции, которые отвечают за укомплектование объекта:

def complect_qc
  obj = {
    :uid => self.id,
    :type => self.lrtype,
    :parid => self.parid,
    :start => self.start,
    :ts => self.ts,
    :rc_time => self.rc_time,
    :state => self.state,
    :rcpt=> self.recipient
  }
  return obj
end
# И так далее...
# Теперь напишем функцию, которая будет отвечать за создание объекта необходимого типа по значению lrtype.

def complect_object_journal
  if @@types_objects.has_key?(self.lrtype)
    return send(@@types_objects[self.lrtype])
  else
    return complect_another
  end
end

# По сути — все! Теперь перепишем тот ужасный switch:
log = log_recs.map { |x| x.complect_object_journal }