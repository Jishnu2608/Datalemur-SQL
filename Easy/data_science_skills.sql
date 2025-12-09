/*Given a table of candidates and their skills, you're tasked with finding the candidates 
best suited for an open Data Science job. 
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
Write a query to list the candidates who possess all of the required skills for the job. 
Sort the output by candidate ID in ascending order.*/

CREATE TABLE candidates (
    candidate_id INT,
    skill VARCHAR(100)
);

INSERT INTO candidates (candidate_id, skill) VALUES
(123, 'Python'),
(123, 'Tableau'),
(123, 'PostgreSQL'),
(234, 'R'),
(234, 'PowerBI'),
(234, 'SQL Server'),
(345, 'Python'),
(345, 'Tableau');

select candidate_id from candidates where skill in ('Python','Tableau','PostgreSQL')
group by candidate_id having count(skill) = 3

