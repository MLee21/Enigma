require '../lib/keys'

class OffSetCalculator

attr_accessor :date, :results

  def initialize
    @date = Time.now.strftime("%m%d%y")
    @results = []
  end

  def format_to_numeric_form
    @date.to_i
  end

  def square_the_formatted_date
    square_of_date = (format_to_numeric_form ** 2).to_s.chars
  end

  def take_last_four_digits
    last_four = square_the_formatted_date.slice!(5..8)
    @results = last_four.map do |i|
      i.to_i
    end
    @results
  end

end

