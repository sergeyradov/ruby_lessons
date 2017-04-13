

class String
       def is_i?
		!!(self =~ /\A[-+]?[0-9]+\z/)
       end
end

warningMessage="Please double check the number that you've entered."
celciusMessage="I have detected temperature in Celcius."
errorMessage="It looks like you have enter data incorrectly!"
hotMessage="ohh..It's hot."
coldMessage="wow..it's cold."

print "Please enter temperature in Celcius or Fahrenheit : "

data=gets.chomp!
unless data.nil? && data.empty? && data.strip.empty?
 value,sign = data.split(' ')

 p value
 p sign
 puts "Sign nil? #{sign.nil?} " #sign.nil?
 puts "Value nil? #{value.nil?} : "#value.nil?

 puts "results #{sign.nil? && value.nil?}" 

 unless sign.nil? & value.nil?

    unless  sign.empty? & value.empty?

     case sign.upcase
     when 'C'	    

       fahrenheitTemp = value.to_i * 1.8 + 32
       puts "This temperature in Fahrenheit : #{fahrenheitTemp} F"
     
     when 'F'    

       celciusTemp = ((value.to_i - 32) / 1.8).round(2)
       puts "This temperature in Celcius : #{celciusTemp} C"
     
     else

	puts errorMessage	

     end

    else

        puts errorMessage

    end
   else

     puts errorMessage

   end
  
 else

  puts errorMessage

end 
