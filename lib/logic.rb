require 'nokogiri'
require 'open-uri'
require 'csv'

class Logic
  def initialize
    @jobs_array = []
    @url = URI.open('https://relocate.me/search')
    @clear_page = Nokogiri::HTML(@url)
    @job_cards = @clear_page.css('div.jobs-list__job')
    @jobs_x_page = (@job_cards.count.to_f - 1.0).to_i
    @total = @clear_page.css('h1.search-page__title').text.split(' ')[2].to_i.to_f
    @last_page = (@total / @jobs_x_page).round
  end

  def display_last_page
    @last_page
  end

  def display_jobs_x_page
    @jobs_x_page
  end

  def scraper(last_page)
    page_number = 1
    while page_number <= last_page.to_i
      numbered_url = URI.open("https://relocate.me/search?page=#{page_number}")
      numbered_clear_page = Nokogiri::HTML(numbered_url)
      numbered_job_cards = numbered_clear_page.css('div.jobs-list__job')
      numbered_job_cards.each do |x|
        job = {
          title: x.css('div.job__title b').text,
          city: x.css('a').text.strip.split('in ')[1].split(',')[0],
          country: x.css('a').text.strip.split('in ')[1].split(', ')[1],
          company: x.css('div.job__company').text.strip,
          url: 'https://relocate.me/' + x.css('a').attribute('href').value
        }
        @jobs_array << job
      end
      page_number += 1
      porcentage(page_number, last_page)
    end
    @jobs_array
  end

  def final_array
    @jobs_array
  end

  def new_csv
    array = final_array
    CSV.open('scraper.csv', 'wb', headers: array.first.keys, write_headers: true) do |csv|
      array.each do |h|
        csv << h.values
      end
    end
  end

  private

  def porcentage(num, var)
    porc = (num / (var.to_i + 1).to_f) * 100
    puts " #{porc.to_i.round}%"
  end
end
