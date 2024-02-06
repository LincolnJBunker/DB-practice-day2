CREATE TABLE students(
    github varchar(30) PRIMARY KEY,
    first_name varchar(30),
    last_name varchar(30)
);

INSERT INTO students(github, first_name, last_name)
VALUES('jhacks', 'Jane', 'Hacker'),
('sdevelops', 'Sarah', 'Developer');

INSERT INTO students(github, first_name, last_name)
VALUES('LincolnJBunker', 'Lincoln', 'Bunker');

CREATE TABLE projects (
    title varchar(50) PRIMARY KEY,
    description TEXT,
    max_grade INTEGER
);

INSERT INTO projects(title, description, max_grade)
VALUES('Markov', 'Tweets generated from Markov chains', 50),
('Blockly', 'Programmatic Logic Puzzle Game', 100);

INSERT INTO projects(title, description, max_grade)
VALUES('Tetris', 'Tetris but you have to code functions to re-arrange the blocks', 450),
('Dougie', 'Use a for loop to teach me how to dougie', 600),
('Just wanna rock', 'buss down thotiana, i wanna see you buss down', 400);

CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_github varchar(30) REFERENCES students,
    project_title varchar(50) REFERENCES projects,
    grade INTEGER
);

INSERT INTO grades(student_github, project_title, grade)
VALUES('jhacks', 'Markov', 10),
('jhacks', 'Blockly', 2),
('sdevelops', 'Markov', 50),
('sdevelops', 'Blockly', 100);

INSERT INTO grades(student_github, project_title, grade)
VALUES('sdevelops', 'Markov', 250),
('LincolnJBunker', 'Dougie', 420);


SELECT
    students.first_name,
    students.last_name,
    grades.project_title,
    grades.grade,
    projects.max_grade
FROM
    students
INNER JOIN grades ON students.github = grades.student_github
INNER JOIN projects ON grades.project_title = projects.title
WHERE github = 'jhacks';