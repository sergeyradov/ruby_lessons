require 'mysql2'

dbhost ='localhost'
dbName = 'school'
user = 'sergey.radov'
password = ''

#open DB connection
client = Mysql2::Client.new(:host => dbhost, :database=>dbName, :username => user, :password=>password)


# 4.1 selects all records from people table
persons = client.query("SELECT * FROM person;")

puts "Persons : 4.1 selects all records from people table"
puts 

persons.each do |row|
	         puts row
end


# 4.2 selects only director
puts  
puts "================================================================="
puts '4.2 selects only director' 
director = "select name,lastName, age,speciality, expirience  from person left join speciality on person.id = speciality.person_id where speciality='director';"

client.query(director).each do |row|
	puts row
end

#4.3 selects students
puts
puts "================================================================="
puts '4.3 selects students'

students = "select * from person left join student on student.person_id=person.id where student.id is not null and course_id is not null;"

client.query(students).each do |row|
	        puts row
end


puts
puts "================================================================="
puts '4.4 selects the most young student'
youngestStudent = "select lastName,name,age,course_id from student left join person on person.id = person_id where age = (select min(age) from student left join person on person.id = person_id);"

client.query(youngestStudent).each do |row|
	                puts row
end

puts
puts "================================================================="
puts "4.5 selects the most old teacher"
yuongestTeacher = "select * from teacher left join person on person.id = person_id where age =(select min(age) from teacher left join person on person.id = person_id) ;"


client.query(yuongestTeacher).each do |row|
	                        puts row
end

puts
puts "================================================================="
puts "4.6 inserts you as a student"

insertMe = " insert into person (name,lastName,age) values ('Sergey','Radov',32);"

client.query(insertMe)
client.query("select * from person where name='Sergey'").each do |row|
	                                puts row
end
	    
#4.7 updates all cleaners who are older 60 to 59
#4.8 writes all people to file
#4.9 deletes third record from the end




# Close db connection
client.close
