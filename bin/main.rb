require_relative '../lib/logic.rb'
require 'nokogiri'
require 'open-uri'

class User
  def initialize
    @my_logic = Logic.new
  end

  @my_logic = Logic.new
  puts "there are #{@my_logic.display_jobs_x_page.to_i} jobs per page in #{@my_logic.display_last_page.to_i} pages"
  puts 'how many pages do you want you scrap?'
  @my_logic.valid_number
  puts 'Do you want to Print (p) or save (s)'
  @my_logic.valid_p_s
end

@my_user = User.new
