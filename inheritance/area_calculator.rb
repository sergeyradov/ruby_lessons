#!/usr/bin/env ruby
# Plan Do it please! Lesson 9 algthorithm 
# TZ 
# I/o
# check ./PseudoCode_AreaCalculator.txt
# UML
# Coding
# RTesting
#
#Figures : Rectagle,Circle,Treangle   

class Figure 
 	attr_accessor :shape

	def initialize (shape)
	        @share = shape
	end
end 

class Triangle < Figure

	attr_accessor :side_a, :side_b, :side_c

        def initialize (shape,side_a,side_b,side_c)
             super(shape)
   	     @side_a = side_a.to_f
	     @side_b = side_b.to_f
	     @side_c = side_c.to_f
	end
	
	def area
		p = ( @side_a + @side_b + @side_c)/2
		return Math.sqrt(p*(p-@side_a)*(p-@side_b)*(p-@side_c));
       end
end

class Circle < Figure

	attr_accessor :radius

	def initialize(shape,radius)
		super(shape)
		@radius = radius.to_f
	end

	def area
		return Math::PI*@radius*@radius
	end
end 

class Rectangle < Figure

	attr_accessor :side_a, :side_b

	def initialize (shape,side_a,side_b)
		super(shape)
	     	@side_a = side_a.to_f
		@side_b = side_b.to_f
	end
	def area
#		puts self.class.name
		return side_a * side_b
	end
end



class FigureReader
	
	attr_accessor :file

	def initialize (file)
	  @file = File.new(file, "r")	
        end

	def calculate_area 
		while (line = @file.gets)
	
			data = line.chomp!.split(',')
  			
			figure, *the_rest = data

			figure.capitalize!

			currentFigure = Object.const_get(figure).new(figure, *the_rest)

		        puts currentFigure.class.name + " : area " + currentFigure.area.round(1).to_s
			
			currentFigure = nil
		end

		file.close
	end
end




FigureReader.new('figures.txt').calculate_area


