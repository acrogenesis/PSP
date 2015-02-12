require 'minitest/autorun'
require_relative '../file_manager'
require_relative '../line_counter'

class TestLineCounter < Minitest::Test
  def setup
    @file = FileManager.new('Archivo1.txt')
  end

  def test_count
    assert_equal LineCounter.count(@file), 21
  end
end
