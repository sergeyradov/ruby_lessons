
warningMessage="Please double check the number that you've entered."
celciusMessage="I have detected temperature in Celcius."
errorMessage="It looks like you have enter data incorrectly!"
hotMessage="ohh..It's hot."
coldMessage="wow..it's cold."

print "Please enter temperature in Celcius or Fahrenheit : "

data=gets.chomp!
value,sign = data.split(' ')
  
  unless data.nil? and data.strip.empty?

    if sign.upcase.include? 'C'

      fahrenheitTemp = value.to_i * 1.8 + 32
      puts "This temperature in Fahrenheit : #{fahrenheitTemp} F"
     
    elsif sign.upcase.include? 'F'
      
      celciusTemp = ((value.to_i - 32) / 1.8).round(2)
      puts "This temperature in Celcius : #{celciusTemp} C"
 
    else
     
      puts errorMessage 
     
    end

  else
  
   puts errorMessage

  end
