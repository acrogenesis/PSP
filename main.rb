#!/usr/bin/env ruby
require_relative 'file_manager'
class Main
  def self.start
    info = read
    info_print(info)
  end

  def self.read
    total_lines = 0
    files_array = []
    print 'Nombre del archivo: '
    file_name = gets.chomp
    while file_name != ''
      file = FileManager.new(file_name)
      files_array << file
      file.count
      total_lines += file.total_lines
      print 'Nombre del archivo: '
      file_name = gets.chomp
    end
    { files_array: files_array, total_lines: total_lines }
  end

  def self.info_print(info)
  end
end

Main.start
