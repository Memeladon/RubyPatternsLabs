require 'fox16'
include Fox

class CreateMainWindow < FXMainWindow
  def initialize(app)
    super(app, "My App", :width=>300, :height=>300)
  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end