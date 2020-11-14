require 'nokogiri'
require 'open-uri'

class Logic
    attr_reader :last_page
    attr_reader :jobs_x_page
def initialize
    $jobs_array = []
    page_number = 1
end

def start
        url = URI.open('https://relocate.me/search')
        clear_page = Nokogiri::HTML(url)
        job_cards = clear_page.css('div.jobs-list__job')
        @jobs_x_page = (job_cards.count.to_f - 1.0).to_i
        total = clear_page.css('h1.search-page__title').text.split(' ')[2].to_i.to_f
        @last_page = (total / @jobs_x_page).round
        puts "there are #{@jobs_x_page} jobs in #{@last_page} pages"
end
end
@logic = Logic.new
@logic.start

#     def scraper(last_page)
#     while @@page_number <= last_page
#       numbered_url = open("https://relocate.me/search?page=#{page_number}")
#       numbered_clear_page = Nokogiri::HTML(numbered_url)
#       numbered_job_cards = numbered_clear_page.css('div.jobs-list__job')
#       numbered_job_cards.each do |x|
#         job = {
#           title: x.css('a').text,
#           company: x.css('div.job__company').text.strip,
#           url: 'https://relocate.me/' + x.css('a').attribute('href').value
#         }
#         @jobs_array << job
#       end
#       page_number += 1
#       porc = (page_number / (last_page + 1).to_f) * 100
#       puts " #{porc.to_i.round}%"
#     end
#     @jobs_array.each_with_index do |x, y|
#       puts "#{y + 1} - #{x}"
#       puts ' '
#     end
#     puts "There are #{@jobs_array.count} jobs to apply"
#     return @jobs_array
#   end
#   def store
#     store = []
#     store < scraper
#   end
# end

def self.new_array
    return @@jobs_array
end

