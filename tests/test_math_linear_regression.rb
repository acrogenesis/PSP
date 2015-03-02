require_relative 'test_helper'

class TestMathLinearRegression < Minitest::Test
  def setup
    file = FileManager.new('test1.src')
    file.count
    @klass_array = file.klass_array
  end

  def test_calculate
    skip
  end
end
