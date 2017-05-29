/*Создать базу данных Школа
Создать таблицы:
Студент имя фамилия возраст курс предметы оценки учителя
Уборщица имя фамилия возраст стаж работы 
Учитель имя фамилия возраст стаж работы предметы
Охранник имя фамилия возраст стаж работы 
Директор колледжа имя фамилия возраст стаж работы подчиненные
 
Создаем таблицу "Person" 
ID, имя, фамилия, возраст

Предметы 
ID,название, часы, курс (YearOfStudy)

Создаем таблицу Grades
ID,student_id, value, course_id, teacher_id

Создаем таблицу Teachers
ID, person_id, course_id 

Создаем таблицу Students
ID,person_id, grade_id, course_id 

Создаем таблицу Specialty
ID,person_id, specialty, expiriance

Foreign key - (указывает на уникальный ключ в другой таблице)
Primary key - ID (идентификация уникальной записи в таблице)

Транзитивые зависимости - связи между сущностями (строки в таблицах) в БД (пример1 - удаление студента, должно привести к удалению данных из таблицы оценки).
(пример2 - удаление учителя из таблицы Учителя - не должно привести к удалению из таблицы Предметы. Но должно привести к удалению из таблицы Person).
*/
CREATE DATABASE IF NOT EXISTS school;
USE school;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS person(
	id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	age INT(11),
	PRIMARY KEY(id)
);

/*ID,название, часы, курс (YearOfStudy)*/

CREATE TABLE IF NOT EXISTS course(
	id INT(11) NOT NULL AUTO_INCREMENT,
	courseName VARCHAR(255) NOT NULL,
	courseHours INT(11) NOT NULL,
	yearOfStudy INT (11),
	PRIMARY KEY(id)
);

/*ID,student_id, value, course_id, teacher_id
ID, person_id, course_id */

CREATE TABLE IF NOT EXISTS teacher(
	id INT(11) NOT NULL AUTO_INCREMENT,
	person_id INT(11),
	course_id INT (11),
	PRIMARY KEY(id),
FOREIGN KEY (person_id)
        REFERENCES person(id)
        ON DELETE CASCADE
);
 
/* ID,person_id, grade_id, course_id */

CREATE TABLE IF NOT EXISTS student(
	id INT(11) NOT NULL AUTO_INCREMENT,
	person_id INT(11) NOT NULL,
	grade_id INT(11),
	course_id INT (11) NOT NULL,
	PRIMARY KEY(id),
FOREIGN KEY (person_id)
        REFERENCES person(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS grade(
	id INT(11) NOT NULL AUTO_INCREMENT,
	courseName VARCHAR(255) NOT NULL,
	student_id INT(11) NOT NULL,
	value VARCHAR(255),
	course_id INT (11) NOT NULL,
	teacher_id INT(11),
	PRIMARY KEY(id),
	FOREIGN KEY (student_id)
        REFERENCES student(id)
        ON DELETE CASCADE
);


/*ID,person_id, specialty, expiriance*/

CREATE TABLE IF NOT EXISTS speciality(
	id INT(11) NOT NULL AUTO_INCREMENT,
	person_id INT(11) NOT NULL,
	speciality VARCHAR(255) NOT NULL,
	expirience VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);
 
