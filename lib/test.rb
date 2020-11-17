require 'nokogiri'
require 'open-uri'

@jobs_array = []
def scraper(last_page)
    page_number = 1
    while page_number <= 1
      numbered_url = URI.open("https://relocate.me/search?page=#{page_number}")
      numbered_clear_page = Nokogiri::HTML(numbered_url)
      numbered_job_cards = numbered_clear_page.css('div.jobs-list__job')
      numbered_job_cards.each do |x|
        job = {
          title: x.css('div.job__title b').text,
          city: x.css('a').text.strip.split('in ')[1],
          company: x.css('div.job__company´[0]').text.strip,
          url: 'https://relocate.me/' + x.css('a').attribute('href').value
        }
        @jobs_array << job
      end
      page_number += 1
      porc = (page_number / (last_page.to_i + 1).to_f) * 100
      puts " #{porc.to_i.round}%"
    end
    puts "There are #{@jobs_array.count} jobs to apply"
    puts @jobs_array
end

scraper(1)