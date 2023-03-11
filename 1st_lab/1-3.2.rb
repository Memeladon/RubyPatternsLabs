def perform
    args = ARGV
    def do_stuff(func, file_path)
      puts func.class
      data = File.open(file_path)
      arr = data.readline.split(' ').map(&:to_i)
      self.send(func, arr)
    end
    puts do_stuff( "#{args[0]}".to_sym, args[1])
  end