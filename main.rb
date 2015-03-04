#!/usr/bin/env ruby
require_relative 'file_manager'
class Main
  def self.start
    file = read
    file_print(file)
  end

  def self.read
    print 'Nombre del archivo: '
    file_name = gets.chomp
    file = FileManager.new(file_name)
    file.calculate
    file
  end

  def self.file_print(file)
    file.pretty_print
  end
end

Main.start
