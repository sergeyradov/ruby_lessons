

warningMessage="Please double check the number that you've entered."
celciusMessage="I have detected temperature in Celcius."
errorMessage="It looks like you have enter data incorrectly!"
hotMessage="ohh..It's hot."
coldMessage="wow..it's cold."

print "Please enter temperature in Celcius or Fahrenheit : "

data=gets.chomp!
 
if data.nil? or data.strip.empty?
	puts errorMessage
	return
end

value,sign = data.split(' ')

 unless sign.nil? or value.nil? or sign.empty? or value.empty?

     case sign.upcase
     when 'C'	    

       fahrenheitTemp = value.to_f * 1.8 + 32
       puts "This temperature in Fahrenheit : #{fahrenheitTemp} F"
     
     when 'F'    

       celciusTemp = ((value.to_f - 32) / 1.8).round(2)
       puts "This temperature in Celcius : #{celciusTemp} C"
     else 
	puts errorMessage
     end
 else 
  puts errorMessage	 
 end
