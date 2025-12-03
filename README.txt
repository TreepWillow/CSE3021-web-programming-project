Members: Peter, Kai, Rishi
Project: Banweb UI Overhaul milestone

Work Delegations
- Peter: Database, Integration of Full Stack Code (put everything together and test/revise it
- Rishi: Backend Servlets
- Kai: Frontend



How To get MySQL + Workbench:  https://www.youtube.com/watch?v=a3HJnbYhXUc


Bug report:
- post method was not being used
	- change form method
- The database was not connecting
	- added MySQL Connector/J JDBC driver dependency into pom.xml so maven can download it
- The displayInfoServlet was not displaying info despite looking fine
	- Did not put in the password for the database connection
- Cant seem to transfer User Id info to other pages
	- used Session object to pass information






How To Run:
1. Open MySQL Workbench
2. Connect to Server
3. Create new schema called "banweb2db"
	- press the database looking button in workbench and apply
4. Load in tables
	1. Connect to your server
	2. File -> Open_SQL_Script
	3. Load "loadInTables.sql"
	4. Click Execute (lightning bolt icon)
5. Run Backend
	1. Open NetBeans
	2. load/copy-paste the project in
	3. press the green play button at the top of the tool bar
	4. input in example user info
		- username: 900123456 password: thispassword


URLs for each webpage/servlet:
- /index.html : will automatically redirect you to login.html
- /login.html : is the login page that will direct you to /home once you successfully login
- /home : Displays info from the database about the current user. Press the change pin link to go to /update-authentication.jsp
- /update-authentication.jsp: You can change you password here. The security question is under development still.

ChangeCredentialsServlet: /change-pin
DisplayInfoServlet: /home
LoginServlet: /login



Databases:


-- Create tables
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    pass VARCHAR(100)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    employee_name VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_name VARCHAR(50),
    pay_rate DECIMAL(7,2)
);

CREATE TABLE hired (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    job_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);

CREATE TABLE time_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hired_id INT,
    clock_in DateTime,
    clock_out DateTime,
    hours_logged DECIMAL(5,2),
    FOREIGN KEY (hired_id) REFERENCES hired(id)
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    student_name VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50),
    instructor VARCHAR(50),
    credits INT
);

CREATE TABLE registered (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    class_id INT,
    grade_percent INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
