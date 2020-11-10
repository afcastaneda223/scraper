require 'nokogiri'
require 'httparty'
require 'byebug'

def scrapper
  url = 'https://relocate.me/search'
  raw_page = HTTParty.get(url)
  clear_page = Nokogiri::HTML(raw_page)
  jobs_array = []
  job_cards = clear_page.css('div.jobs-list__job')
  page_number = 1
  jobs_x_page = (job_cards.count.to_f - 1.0)
  total = clear_page.css('h1.search-page__title').text.split(' ')[2].to_i.to_f
  last_page = (total / jobs_x_page).round
  while page_number <= last_page
    numbered_url = "https://relocate.me/search?page=#{page_number}"
    numbered_raw_page = HTTParty.get(numbered_url)
    numbered_clear_page = Nokogiri::HTML(numbered_raw_page)
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
end

scrapper
