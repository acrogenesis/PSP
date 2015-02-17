require_relative 'test_helper'

class TestLineCounter < Minitest::Test
  def setup
    @file = FileManager.new('Archivo1.txt')
  end

  def test_count
    assert_equal LineCounter.count(@file), 21
  end
end
