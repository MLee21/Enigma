class OffSetCalculator

attr_accessor :date

  def initialize(date = Time.now.strftime("%m%d%y"))
    @date = date
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

  def off_set_for_rotation_a
    take_last_four_digits[0]
  end

  def off_set_for_rotation_b
    take_last_four_digits[1]
  end

  def off_set_for_rotation_c
    take_last_four_digits[2]
  end

  def off_set_for_rotation_d
    take_last_four_digits[3]
  end
end



