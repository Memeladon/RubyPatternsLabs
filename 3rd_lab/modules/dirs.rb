# frozen_string_literal: true

module DIRS
  Dir.mkdir("3rd_lab/database_scripts") unless Dir.exist?("3rd_lab/database_scripts")
  STRUCTURE_DIR = '3rd_lab/database_scripts/structure_changes'
  DATA_DIR = '3rd_lab/database_scripts/data_scripts'
  Dir.mkdir(STRUCTURE_DIR) unless File.exist?(STRUCTURE_DIR)
  Dir.mkdir(DATA_DIR) unless File.exist?(DATA_DIR)
  File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
  File.new(File.join(STRUCTURE_DIR, 'create_student_table.sql'), 'w')
end
