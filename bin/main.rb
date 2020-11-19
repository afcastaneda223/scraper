require_relative '../lib/logic.rb'
require 'nokogiri'
require 'open-uri'

class User1
  def initialize
    @my_logic = Logic.new
  end

  def new_search
    puts "There are #{@my_logic.display_jobs_x_page.to_i + 1} jobs per page"
    puts "i1n a total of #{@my_logic.display_last_page.to_i} pages"
    puts 'How many pages do you want you scrap?'
    valid_number
    puts 'Do you want to print (p) or save (s)?'
    valid_p_s
    puts 'Do you want to do a new search? yes / no '
    valid_y_n
  end
end

@my_user = User1.new
@my_user.new_search
