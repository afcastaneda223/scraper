require_relative '../lib/logic.rb'
require 'nokogiri'
require 'open-uri'

class User
  def initialize
    @my_logic = Logic.new
  end

  @my_logic = Logic.new
  puts "There are #{@my_logic.display_jobs_x_page.to_i + 1} jobs per page in #{@my_logic.display_last_page.to_i} pages"
  puts 'How many pages do you want you scrap?'
  @my_logic.valid_number
  puts 'Do you want to print (p) or save (s)?'
  @my_logic.valid_p_s
end

@my_user = User.new
