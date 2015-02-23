require_relative 'line_counter'
class FileManager
  # Get and Set for file_name, blank_lines, and info_lines
  attr_accessor :file_name, :total_lines, :klass_array

  # FileManager.new arguments
  def initialize(file_name)
    self.file_name = file_name
    self.total_lines = 0
    check_exceptions
  end

  # Calls LineCounter to count lines
  def count
    file_info = LineCounter.count(File.readlines file_name)
    self.total_lines = file_info[:other_lines]
    self.klass_array = file_info[:klass_array]
  end

  def total_lines
    @total_lines + klass_array.map(&:total_lines).inject(:+)
  end

  private

  def check_exceptions
    if File.extname(file_name) == '.src'
      if File.exist?(file_name)
        if File.readable?(file_name)
          true
        else
          puts 'Error: Archivo no se puede leer.'
          exit(0)
        end
      else
        puts "Error: El archivo \"#{file_name}\" no existe."
        exit(0)
      end
    else
      puts 'Error: Solo se permite archivos .src.'
      exit(0)
    end
  end
end
