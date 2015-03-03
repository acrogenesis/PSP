require_relative 'math_linear_regression'
class FileManager
  # Get and Set for file_name, blank_lines, and info_lines
  attr_accessor :file_name, :linear_regression

  # FileManager.new arguments
  def initialize(file_name)
    self.file_name = file_name
    check_exceptions
  end

  def calculate
  end

  def pretty_print
  end

  private

  def check_exceptions
    # el archivo tiene xk
    # el archivo tiene al menos 1 par, osea N <= 1
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
