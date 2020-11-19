# rubocop:disable Metrics/MethodLength
# rubocop:disable LineLength
require_relative '../lib/logic.rb'
# checks for valid input and uses response
class Check
  def initialize
    @my_logic = Logic.new
    @my_user = User1.new
  end

  def loop1
    var = nil
    loop do
      var = gets.chomp
      break if number?(var) || var == 's' || var == 'p' || var == 'yes' || var == 'no'
      puts 'Enter a valid option'
    end
    var
  end

  def response(loop1)
    if number?(loop1)
      @my_logic.scraper(loop1)
    elsif loop1 == 's'
      @my_logic.new_csv
    elsif loop1 == 'p'
      @my_logic.final_array.each_with_index do |x, y|
        puts "#{y + 1} - #{x}"
        puts ' '
      end
    elsif loop1 == 'yes'
      @my_user.new_search
    elsif loop1 == 'no'
      puts 'Thank you!'
      true
    else
      false
    end
  end

  def number?(num)
    num.to_i <= @my_logic.display_last_page.to_i && num.to_i != 0
  end
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable LineLength
