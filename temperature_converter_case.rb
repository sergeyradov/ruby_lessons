

error_message = 'It looks like you have enter data incorrectly!'
error_miissed_symbol = 'Hoo.. have you entered C or F'
error_wrong_symbols = 'Hmm... It looks I can\'t convert from this degree.'

print 'Please enter temperature in Celcius or Fahrenheit : '

data = gets.chomp!

if data.nil? || data.strip.empty?
  puts error_message
  return
end

value, sign = data.split(' ')

if sign.nil? || value.nil?
  puts error_miissed_symbol
  return
end

unless sign.nil? || value.nil? || sign.empty? || value.empty?

  case sign.upcase
  when 'C'
    fahrenheit_temp = value.to_f * 1.8 + 32
    puts "This temperature in Fahrenheit : #{fahrenheit_temp} F"
  when 'F'
    celcius_temp = ((value.to_f - 32) / 1.8).round(2)
    puts "This temperature in Celcius : #{celcius_temp} C"
  else
    puts error_wrong_symbols
  end
end
