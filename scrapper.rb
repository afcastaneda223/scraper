require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

def scrapper
  url = 'https://relocate.me/search'
  clear_page = Nokogiri::HTML(open(url))
  jobs_array = []
  job_cards = clear_page.css('div.jobs-list__job')
  page_number = 1
  jobs_x_page = (job_cards.count.to_f - 1.0)
  total = clear_page.css('h1.search-page__title').text.split(' ')[2].to_i.to_f
  last_page = (total / jobs_x_page).round
  while page_number <= last_page
    numbered_url = "https://relocate.me/search?page=#{page_number}"
    numbered_clear_page = Nokogiri::HTML(open(numbered_url))
    numbered_job_cards = numbered_clear_page.css('div.jobs-list__job')
    numbered_job_cards.each do |x|
      job = {
        title: x.css('a').text,
        company: x.css('div.job__company').text.strip,
        url: 'https://relocate.me/' + x.css('a').attribute('href').value
      }
      jobs_array << job
    end
    page_number += 1
  end
  puts jobs_array.first
end

scrapper
