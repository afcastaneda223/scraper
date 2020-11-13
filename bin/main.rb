require_relative '../lib/logic.rb'
require 'nokogiri'
require 'open-uri'


class User
    def initialize
        @my_logic = Logic.new
    end
    
    def welcome
        attr_reader page_number
        puts "hello there are #{@my_logic.jobs_x_page} jobs in #{@my_logic.last_page}"
    end
end

User.welcome