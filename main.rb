#!/usr/bin/env ruby
require_relative 'calc_manager'
#&p-Main
#&b=48
class Main
  #&i
  def self.start
    calc = user_input
    pretty_print(calc)
  end

  #&i
  def self.user_input
    print 'Ingrese x: '
    x = gets.chomp
    print 'Ingrese dof: '
    dof = gets.chomp
    CalcManager.new(x: x.to_f, dof: dof)
  end

  #&i
  def self.pretty_print(calc)
    calc.pretty_print
  end
end

Main.start
