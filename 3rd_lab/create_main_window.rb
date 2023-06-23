require 'fox16'
include Fox

class CreateMainWindow < FXMainWindow
  def initialize(app)
    super(app, "My App", :width=>640, :height=>640)
    @table = FXTable.new(self, :opts=>LAYOUT_EXPLICIT, :width=>600, :height=>300 )
    @table.visibleColumns = 8
    @table.visibleRows = 5

  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

# app = FXApp.new
# CreateMainWindow.new(app)
# app.create
# app.run