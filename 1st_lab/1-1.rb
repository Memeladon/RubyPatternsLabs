puts("Hello world!")

username = ARGV[0]
 
  puts "Как тебя зовут?"
  puts "Привет, #{username} \nКакой твой любимый язык программирования?"
  answer = STDIN.gets.chop.downcase
  case answer
  when 'ruby'
    puts "А может ты еще и лабы делаешь?"
  when 'java'
    puts "Годно, очень годно."
  when 'python'
    puts "Нормальный язык выучи для начала."
  when 'c++'
    puts "Ты мне нравишься. Продолжай в том же духе!"
  else
    puts 'Ну, время подумать еще есть...'
  end

ruby = "puts 'Hello!'"
eval ruby

cmd = "ls"
system cmd
