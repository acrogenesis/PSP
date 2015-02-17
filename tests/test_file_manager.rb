require_relative 'test_helper'

class TestFileManager < Minitest::Test
  def setup
    @file = FileManager.new('Archivo1.txt')
    @file.count
  end

  # Returns correct name
  def test_name
    assert_equal 'Archivo1.txt', @file.file_name
  end

  # Calls LineCounter and sets blank_lines, info_lines
  def test_count
    assert_equal @file.blank_lines, 11
    assert_equal @file.info_lines, 10
  end

  def test_total
    assert_equal @file.total, 21
  end
end
