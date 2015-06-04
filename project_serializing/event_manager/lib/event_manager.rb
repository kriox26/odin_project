require 'date'
require 'erb'
require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do 
	puts form_letter
  end
end

def clean_phone_numbers(phone_number)
  phone_digits = phone_number.scan(/\d/).join
  if phone_digits.length == 10 || (phone_digits.length == 11 && phone_digits[0] == 1)
	phone_digits.rjust(11,"1")[1..10]
  else
	"0000000000"
  end
end

def most_registered_hour(hour_hash)
  most_popular = hour_hash.select do |hour,registration|
	registration == hour_hash.values.max
  end
  most_popular.keys.join(", ")
end

def most_registered_week_day(week_day_hash)
  weekdays = %w{ Sunday Monday Tuesday Wednesday Thursday Friday Saturday  }
  most_popular = week_day_hash.select do |week_day, registration|
	registration == week_day_hash.values.max
  end
  most_popular.keys.map { |weekday_code| weekdays[weekday_code]  }.join(", ")
end
puts "EventManager initialized"

contents = CSV.open("event_attendees.csv",headers: true, header_converters: :symbol)

template_letter = File.read("form_letter.erb")
erb_template = ERB.new(template_letter)
hour_hash = Hash.new(0)
week_day_hash = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
  datetime = DateTime.strptime(row[:regdate], '%m/%d/%y %k:%M')
  hour_hash[datetime.hour] += 1
  week_day_hash[datetime.wday] += 1
end 

puts "Most popular hour: #{most_registered_hour(hour_hash)}"
puts "Most popular day of the week: #{most_registered_week_day(week_day_hash)}"
