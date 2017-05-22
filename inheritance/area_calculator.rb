#!/usr/bin/env ruby
# Plan Do it please! Lesson 9 algthorithm 
# TZ 
# I/o
# Algo
# UML
# Coding
# RTesting
#
#Figures : Rectagle,Circle,Treangle   

class Figure 
 attr_accessor:color, :shape	
	def area
    		print self.class.name
 	end
end 

class Treangle < Figure

       def area(a=1,b=1,c=1)	
		puts self.class.name
		#S = √p(p - a)(p - b)(p - c)
		 p = (a + b + c)*0.5
		return Math.sqrt(p*(p-a)*(p-b)*(p-c));
       end
end

class Circle < Figure 
	def area(r=1)
		puts self.class.name
		return Math::PI*r*r
	end
end 

class Rectangle < Figure
	def area(a=1,b=2)
		puts self.class.name
		return a*b
	end
end


file = File.new("figures.txt", "r")
while (line = file.gets)
	    puts "#{line}"
end
file.close


