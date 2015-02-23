class ClassManager
  attr_accessor :name, :type, :base_lines, :item_count, :delete_count, :modified_count, :total_lines

  def initialize(args)
    @name = args[:name]
    @item_count = 0
    @delete_count = 0
    @modified_count = 0
    @total_lines = 0
    @base_lines = 0
  end

  def added_lines
    total_lines - base_lines + delete_count
  end

  def real_type
    return 'nueva' if type.nil?
    return 'reusada' if total_lines == base_lines
    type
  end

  # Pretty prints file info
  def pretty_print
    print "#{name}: T=#{total_lines}, I=#{item_count} "
    return unless type == 'base'
    print "B=#{base_lines},"
    return unless real_type == 'base'
    print " D=#{delete_count}, "
    print "M=#{modified_count}, "
    print "A=#{added_lines}"
  end
end
