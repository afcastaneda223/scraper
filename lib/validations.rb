class Validations
  def valid_number
    validate(gets.chomp) || try_again
  end

  def validate_p_s(var)
    if var == 's'
      @my_logic.new_csv
    elsif var == 'p'
      @my_logic.final_array.each_with_index do |x, y|
        puts "#{y + 1} - #{x}"
        puts ' '
      end
    else
      false
    end
    end

  def try_again
    puts 'Enter a valid number'
    valid_number
  end

  def valid_p_s
    validate_p_s(gets.chomp) || try_again_2
  end

  def valid_y_n
    validate_y_n(gets.chomp) || try_again_3
  end

  def validate_y_n(var)
    if var == 'yes'
      new_search
    elsif var == 'no'
      puts 'Thank you!'
      true
    else
      false
    end
  end

  def number?(num)
    num.to_i <= @my_logic.display_last_page.to_i && num.to_i != 0
  end

  def validate(var)
    if number?(var)
      @my_logic.scraper(var)
    else
      false
    end
  end

  def try_again_2
    puts 'Enter s or p'
    valid_p_s
  end

  def try_again_3
    puts 'Enter yes or no'
    valid_y_n
  end
  end
