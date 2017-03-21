days = 25 * (366 + 365*3)

count = 0
day = 2
day_of_month = 1
month = 1
year = 1

(0..days).each do 
  count += 1 if day_of_month == 1 && day == 7
  day += 1
  day = 1 if day == 8
  day_of_month += 1
  if(month == 1 && day_of_month == 32)
    month = 2
    day_of_month = 1
  elsif(month == 2 && year != 4 && day_of_month == 29)
    month = 3
    day_of_month = 1
  elsif(month == 2 && year == 4 && day_of_month == 30)
    month = 3
    day_of_month = 1
  elsif(month == 3 && day_of_month == 32)
    month = 4
    day_of_month = 1
  elsif(month == 4 && day_of_month == 31)
    month = 5
    day_of_month = 1
  elsif(month == 5 && day_of_month == 32)
    month = 6
    day_of_month = 1
  elsif(month == 6 && day_of_month == 31)
    month = 7
    day_of_month = 1
  elsif(month == 7 && day_of_month == 32)
    month = 8
    day_of_month = 1
  elsif(month == 8 && day_of_month == 32)
    month = 9
    day_of_month = 1
  elsif(month == 9 && day_of_month == 31)
    month = 10
    day_of_month = 1
  elsif(month == 10 && day_of_month == 32)
    month = 11
    day_of_month = 1
  elsif(month == 11 && day_of_month == 31)
    month = 12
    day_of_month = 1
  elsif(month == 12 && day_of_month == 32)
    month = 1
    day_of_month = 1
    year += 1
    year = 1 if year == 5
  end
end

puts count