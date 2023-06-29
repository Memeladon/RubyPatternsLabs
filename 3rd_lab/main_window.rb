require 'fox16'
include Fox

# Контроллер это стратегия для Вьюхи!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Во вьюхе есть ссылка на объект контроллера. У контроллера есть на модель.

class MainWindow < FXMainWindow
  def initialize(app)
    super(app, "My App", nil, nil, DECOR_ALL, 0, 0, 1024, 512)

    @t_items = 0
    @cur_page = 0
    @all_pages = 0

    # header
    header_frame = FXHorizontalFrame.new(self, FRAME_THICK|LAYOUT_FILL_X|LAYOUT_TOP)
    @b_refresh = FXButton.new(header_frame,
                              "Refresh",
                              :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                              :width => 160, :height => 40)
    @b_add = FXButton.new(header_frame,
                          "Add",
                          :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                          :width => 160, :height => 40)
    @b_edit = FXButton.new(header_frame,
                           "Edit",
                           :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                           :width => 160, :height => 40)
    @b_delete = FXButton.new(header_frame,
                             "Delete",
                             :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                             :width => 160, :height => 40)

    @b_refresh.backColor = FXRGB(180, 200,230)
    @b_add.backColor = FXRGB(180, 200,230)
    @b_delete.backColor = FXRGB(180, 200,230)
    @b_edit.backColor = FXRGB(180, 200,230)
    @b_edit.enabled = false
    @b_delete.enabled = false
    @b_add.enabled = false

    # footer
    footer = FXHorizontalFrame.new(self, FRAME_THICK|LAYOUT_FILL_X|LAYOUT_SIDE_BOTTOM)
    FXLabel.new(footer, "Page #{@cur_page} of #{@all_pages}    ")
    FXLabel.new(footer, "#{@t_items} items    ")

    ar_frame = FXHorizontalFrame.new(footer, LAYOUT_CENTER_X)
    ar_frame.padRight = 136
    @arrowButton_1 = FXArrowButton.new(ar_frame, nil, 0,
                                       FRAME_RAISED|FRAME_THICK|ARROW_LEFT|LAYOUT_FIX_WIDTH,:width => 60)
    @arrowButton_2 = FXArrowButton.new(ar_frame, nil, 0,
                                       FRAME_RAISED|FRAME_THICK|ARROW_RIGHT|LAYOUT_FIX_WIDTH,:width => 60)

    @arrowButton_1.backColor = FXRGB(180, 200,230)
    @arrowButton_2.backColor = FXRGB(180, 200,230)


    # nav & main
    section_frame = FXHorizontalFrame.new(self, LAYOUT_TOP|LAYOUT_FILL)

    # nav
    nav_frame = FXVerticalFrame.new(section_frame, FRAME_THICK|LAYOUT_FILL_Y|LAYOUT_LEFT)

    # Fullname
    l_fn = FXLabel.new(nav_frame, "Fullname")
    tf_fn = FXTextField.new(nav_frame, 20)

    # Git
    matrix_git = FXMatrix.new(nav_frame, 2, MATRIX_BY_COLUMNS|LAYOUT_FILL_X)
    l_git = FXLabel.new(matrix_git, "Git           ")
    @cb_git = FXComboBox.new(matrix_git, 10)
    @cb_git.appendItem("Yes")
    @cb_git.appendItem("No")
    @cb_git.appendItem("No matter")

    @tf_git = FXTextField.new(nav_frame, 20)
    @tf_git.text = "git"

    @cb_git.connect(SEL_COMMAND) do |sender, sel, data|
      if data == "Yes"
        @tf_git.enabled = true
      else
        @tf_git.enabled = false
      end
    end

    # Email
    matrix_email = FXMatrix.new(nav_frame, 2, MATRIX_BY_COLUMNS|LAYOUT_FILL_X)
    l_email = FXLabel.new(matrix_email, "Email      ")
    @cb_email = FXComboBox.new(matrix_email, 10)
    @cb_email.appendItem("Yes")
    @cb_email.appendItem("No")
    @cb_email.appendItem("No matter")

    @tf_email = FXTextField.new(nav_frame, 20)
    @tf_email.text = "email"

    @cb_email.connect(SEL_COMMAND) do |sender, sel, data|
      if data == "Yes"
        @tf_email.enabled = true
      else
        @tf_email.enabled = false
      end
    end


    # Phone
    matrix_phone = FXMatrix.new(nav_frame, 2, MATRIX_BY_COLUMNS|LAYOUT_FILL_X)
    l_phone = FXLabel.new(matrix_phone, "Phone     ")
    @cb_phone = FXComboBox.new(matrix_phone, 10)
    @cb_phone.appendItem("Yes")
    @cb_phone.appendItem("No")
    @cb_phone.appendItem("No matter")

    @tf_phone = FXTextField.new(nav_frame, 20)
    @tf_phone.text = "phone"

    @cb_phone.connect(SEL_COMMAND) do |sender, sel, data|
      if data == "Yes"
        @tf_phone.enabled = true
      else
        @tf_phone.enabled = false
      end
    end

    # Telegram
    matrix_telegram = FXMatrix.new(nav_frame, 2, MATRIX_BY_COLUMNS|LAYOUT_FILL_X)
    l_telegram = FXLabel.new(matrix_telegram, "Telegram")
    @cb_telegram = FXComboBox.new(matrix_telegram, 10)
    @cb_telegram.appendItem("Yes")
    @cb_telegram.appendItem("No")
    @cb_telegram.appendItem("No matter")

    @tf_telegram = FXTextField.new(nav_frame, 20)
    @tf_telegram.text = "telegram"

    @cb_telegram.connect(SEL_COMMAND) do |sender, sel, data|
      if data == "Yes"
        @tf_telegram.enabled = true
      else
        @tf_telegram.enabled = false
      end
    end


    # main table
    main_frame = FXVerticalFrame.new(section_frame, FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y)

    @table = FXTable.new(main_frame, :opts => LAYOUT_FILL|TABLE_NO_ROWSELECT)
    @table.editable = false
    @table.tableStyle |= TABLE_COL_SIZABLE

    @table.setTableSize(15, 4)#6 строк

    @table.setColumnText(0, "ID")
    @table.setColumnText(1, "Full name")
    @table.setColumnText(2, "Git")
    @table.setColumnText(3, "Contact")

    fiotrial = FXTableItem.new("G.S. Muchas")
    gittrial = FXTableItem.new("https://github.com/username/spanich")
    phonetrial = FXTableItem.new("8-10-34-93-123 45 67")
    idtrial = FXTableItem.new("1")

    @table.setItem(0, 0, idtrial)
    @table.setItem(0, 1, fiotrial)
    @table.setItem(0, 2, gittrial)
    @table.setItem(0, 3, phonetrial)

    selected_items = []
    @table.connect(SEL_SELECTED) do |sender, sel, pos|
      item = [pos.row, pos.col]
      selected_items << item unless selected_items.include? item
      if selected_items.length == @items && selected_items[0][1] == selected_items[1][1]

      end
      if selected_items.length == 4 && self.inOneRow(selected_items)
        @b_edit.enabled = true
        @b_delete.enabled = true
        @b_add.enabled = true
      end
      if selected_items.length != 4 && selected_items.length % 4 == 0 && self.inRows(selected_items)
        @b_edit.enabled = false
        @b_add.enabled = false
        @b_delete.enabled = true
      end
    end

    @table.connect(SEL_DESELECTED) do |sender, sel, pos|
      selected_items.delete([pos.row, pos.col])
      @b_edit.enabled = false
      @b_delete.enabled = false
      @b_add.enabled = false
    end

    def inOneRow (arr_rows_cols)
      row = arr_rows_cols[0][0]
      arr_rows_cols.each do |el|
        return false if row != el[0]
      end
      true
    end

    def inRows (arr_rows_cols)
      arr = []
      arr_rows_cols.each do |el|
        arr << el[0]
      end
      counts = arr.group_by(&:itself).map { |k, v| [v.count] if v.count != 4}.compact
      counts.empty?()
    end
    # table.connect(SEL_COMMAND) do |sender, sel, data|
    #   puts "anchor row, col = #{sender.anchorRow}, #{sender.anchorColumn}"
    # end
  end

#   ===============================================================================================================   #
  def fill_table
    # Обращаемся к базе данных и получаем список студентов
    students = Student.all

    # Очищаем таблицу перед заполнением
    @table.clearItems

    # Заполняем таблицу данными
    students.each_with_index do |student, row|
      @table.setItemText(row, 0, student.id.to_s)
      @table.setItemText(row, 1, student.full_name)
      @table.setItemText(row, 2, student.git)
      @table.setItemText(row, 3, student.contact)
    end
  end
end

# Create application
app = FXApp.new
window = MainWindow.new(app)

# Show window and start event loop
app.create
window.show(PLACEMENT_SCREEN)
app.run