class FileManager
  # Get and Set for file_name, blank_lines, and info_lines
  attr_accessor :file_name, :blank_lines, :info_lines

  # FileManager.new arguments
  def initialize(file_name)
    self.file_name = file_name
    self.blank_lines = 0
    self.info_lines = 0
    check_exceptions
  end

  # Calls LineCounter to count lines
  def count
    LineCounter.count(self)
    true
  end

  # Returns total count
  def total
    blank_lines + info_lines
  end

  # Pretty prints file info
  def pretty_print
    puts "Nombre del archivo: #{file_name}"
    puts "Cantidad de líneas en blanco: #{blank_lines}"
    puts "Cantidad de líneas con información: #{info_lines}"
    puts '--------------------------------------------'
  end

  private

  def check_exceptions
    if File.extname(file_name) == '.txt'
      if File.exist?(file_name)
        if File.readable?(file_name)
          true
        else
          fail 'Error: Archivo no se puede leer.'
        end
      else
        fail "Error: El archivo \"#{file_name}\" no existe."
      end
    else
      fail 'Error: Solo se permite archivos .txt.'
    end
  end
end
