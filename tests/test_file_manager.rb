require_relative 'test_helper'

class TestFileManager < Minitest::Test
  def setup
    @file = FileManager.new('test1.src')
    @file.count
  end

  # Returns correct name

  def test_check_exceptions
  end

  def test_pretty_print
    skip
  end
end
