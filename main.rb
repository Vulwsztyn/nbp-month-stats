require 'date'
require 'httparty'
require 'hash_dot'

Hash.use_dot_syntax = true
Hash.hash_dot_use_default = true

def process_response(response, currency)
  data = response.map do |day|
    [day.effectiveDate, day.rates.find {|x| x.code == currency}.mid]
  end.sort_by {|x| x[1]}
  puts data.map {|x| "#{x[0]} #{x[1]}"}.join("\n")
end

def main
    currency = ARGV.length > 0 ? ARGV[0] : 'USD'
    month = ARGV.length > 1 ? ARGV[1].to_i : Date.today.month
    year = ARGV.length > 2 ? 2000+ARGV[2].to_i : Date.today.year
    
    start_date = month > 1 ? Date.new(year, month - 1, -1) : Date.new(year - 1, 12, -1)
    end_date = Date.new(year, month, -1) > Date.today ? Date.today : Date.new(year, month, -1)

    if start_date > Date.today
        puts 'No future'
        return
    end
    puts "Looking for #{currency} rates from #{start_date.to_s} to #{end_date.to_s}:"
    response = HTTParty.get("http://api.nbp.pl/api/exchangerates/tables/A/#{start_date.to_s}/#{end_date.to_s}/")
    process_response response, currency
end

main