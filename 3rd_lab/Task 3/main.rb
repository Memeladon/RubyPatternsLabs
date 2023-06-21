require_relative '../Task 3/create_main_window'

app = FXApp.new
CreateMainWindow.new(app)
app.create
app.run
