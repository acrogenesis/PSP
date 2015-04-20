require_relative 'simpson'

#&p-MathLinearRegression
#&b=40
class MathLinearRegression
  attr_accessor :N, :xk, :r, :b0, :b1, :yk, :x_array, :y_array, :x_average, :y_average, :sum_x,
                :sum_y, :sum_xy, :sum_x2, :sum_y2, :sig, :ran, :ls, :li #&m

  E = 0.00000001

  #&i
  def initialize(content)
    # sets N, xk, x_array and y_array
    self.x_array = []
    self.y_array = []
    self.xk = content.shift.to_i
    content.each do |val|
      x, y = val.split(',')
      x_array << x.to_f
      y_array << y.to_f
    end
    self.N = x_array.count
  end

  #&i
  def calculate
    calculate_sums
    calc_b1
    calc_r
    calc_b0
    calc_yk

    calc_sig
    calc_ran
    calc_ls
    calc_li
  end

  #&i
  def r2
    r**2
  end

  private

  #&i
  def calculate_x(p_user, dof)
    simpson = Simpson.new(p_user, dof)
    x = 0.0
    p_calc = simpson.calculate.round(5)
    while (p_calc - p_user).abs > E
      if p_calc > p_user
        adjust_d(current: 1, previous: adjust_flag)
        x -= d
        adjust_flag = 1
      else
        adjust_d(current: -1, previous: adjust_flag)
        x += d
        adjust_flag = -1
      end
      simpson = Simpson.new(x, dof)
      p_calc = simpson.calculate.round(5)
    end
    x
  end

  #&i
  def adjust_d(args)
    return if args[:previous] == 0
    return if args[:current] == args[:previous]
    self.d = d / 2
  end

  #&i
  def calc_sig
  end

  #&i
  def calc_ran
  end

  #&i
  def calc_ls
  end

  #&i
  def calc_li
  end

  #&i
  def calculate_sums
    # Sums of X & Y
    self.sum_x = x_array.reduce(&:+)
    self.sum_y = y_array.reduce(&:+)
    # Averages of X & Y
    self.x_average = sum_x / self.N
    self.y_average = sum_y / self.N
    # Sums of x**2, y**2, x*y
    self.sum_x2 = x_array.reduce(0) { |a, e| a + e**2 }
    self.sum_y2 = y_array.reduce(0) { |a, e| a + e**2 }
    temp_xy = 0
    (0..self.N - 1).each do |i|
      temp_xy += x_array[i] * y_array[i]
    end
    self.sum_xy = temp_xy
  end

  #&i
  def calc_b1
    self.b1 = (sum_xy - (self.N * x_average * y_average)) / (sum_x2 - (self.N * (x_average**2)))
  end

  #&i
  def calc_r
    self.r = ((self.N * sum_xy) - (sum_x * sum_y)) / Math.sqrt(((self.N * sum_x2) - sum_x**2) * ((self.N * sum_y2) - sum_y**2))
  end

  #&i
  def calc_b0
    self.b0 = y_average - b1 * x_average
  end

  #&i
  def calc_yk
    self.yk = b0 + b1 * xk
  end
end
