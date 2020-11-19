# rubocop:disable Metrics/AbcSize
# rubocop:disable LineLength

require_relative '../lib/logic.rb'
require_relative '../lib/check.rb'
require 'nokogiri'
require 'open-uri'

# general class calls and runs logic and imputs
class User1
  def initialize
    @my_logic = Logic.new
    @check = Check.new
  end

  def new_search
    puts "There are #{@my_logic.display_jobs_x_page.to_i + 1} jobs per page"
    puts "in a total of #{@my_logic.display_last_page.to_i} pages"
    puts "How many pages do you want you scrap? (between 1 and #{@my_logic.display_last_page.to_i})"
    @check.response(@check.loop1)
    puts 'Do you want to print (p) or save (s)? p / s'
    @check.response(@check.loop1)
    puts 'Do you want to do a new search? yes / no '
    @check.response(@check.loop1)
  end
end

@my_user = User1.new
@my_user.new_search

# rubocop:enable Metrics/AbcSize
# rubocop:enable LineLength
