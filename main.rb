#!/usr/bin/env ruby
require_relative 'file_manager'
require_relative 'line_counter'
total_files = 0
total_blank_lines = 0
total_info_lines = 0
files_Array = []
print 'Nombre del archivo: '
file_name = gets.chomp
while file_name != ''
  puts file_name.inspect
  file = FileManager.new(file_name)
  files_Array << file
  file.count
  total_blank_lines += file.blank_lines
  total_info_lines += file.info_lines
  total_files += 1
  print 'Nombre del archivo: '
  file_name = gets.chomp
end
files_Array.sort! do |a1, a2|
  a1.info_lines <=> a2.info_lines
end
files_Array.each(&:pretty_print)

puts 'TOTALES:'
puts "Cantidad de archivos: #{total_files}"
puts "Cantidad total de líneas en blanco: #{total_blank_lines}"
puts "Cantidad total de líneas con información: #{total_info_lines}"
