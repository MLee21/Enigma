class OffSetCalculator

attr_accessor :date, :results

  def initialize
    @date = Time.now.strftime("%m%d%Y")
    @results = []
  end

  def formatted_date 
    date = @date.chars
    date.slice!(4..5)
    date.join("")
  end

  def format_to_numeric_form
    formatted_date.to_i
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

calc = OffSetCalculator.new
print calc.take_last_four_digits
