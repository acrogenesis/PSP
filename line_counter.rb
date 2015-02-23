require_relative 'class_manager'
class LineCounter
  def self.count(content)
    inclass = false
    skip = false
    klass = nil
    klass_array = []
    other_lines = 0
    content.each_with_index do |val, inx|
      val = val.strip
      if skip
        if val =~ %r{^.*\*/}
          skip = false
        end
        next
      end
      if val =~ %r{^\s*/\*}
        skip = true unless val =~ %r{^.*\*/}
        next
      end

      if inclass
        # puts val if klass.name = 'Cliente'
        klass.total_lines += 1 unless val =~ %r{^(\s*//|\s*$|\s*[{}]\s*[^\w]{;})} || val =~ /^\s*[{}]\s*$/
        # puts "#{inx}: #{val}" unless val =~ %r{^(\s*//|\s*$|\s*[{}]\s*[^\w]{;})} || val =~ /^\s*[{}]\s*$/
        if val =~ %r{//&b=}
          klass.type = 'base'
          klass.base_lines += val.gsub(%r{//&b=}, '').to_i
        elsif val =~ %r{//&i}
          klass.item_count += 1
        elsif val =~ %r{//&d}
          klass.delete_count += val.delete('^0-9').to_i
        elsif val =~ %r{//&m}
          klass.modified_count += 1
        end
        if content[inx + 1] =~ %r{//&p}
          inclass = false
          klass_array << klass
        end
      elsif val =~ %r{//&p}
        klass = ClassManager.new(name: val.gsub(%r{//&p-}, '').strip)
        inclass = true
      else
        other_lines +=1 unless val =~ %r{^(\s*//|\s*$|\s*[{}]\s*[^\w]{;})} || val =~ /^\s*[{}]\s*$/
      end
    end
    klass_array << klass
    # f = File.read(file.file_name)
    # if f == ''
    #   file.blank_lines = 1
    #   return 1
    # end
    # total = f.scan(/$|\Z/).count
    # file.blank_lines = f.scan(/^( |\t|)*(\n|\r\n|\r)/).count + f.scan(/\n\Z/).count
    # file.info_lines = total - file.blank_lines
    # total
    {klass_array: klass_array, other_lines: other_lines}
  end
end
