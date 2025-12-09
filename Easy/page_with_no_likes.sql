/*Assume you're given two tables containing data about Facebook Pages and their respective likes 
(as in "Like a Facebook Page").
Write a query to return the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.*/

-- Create pages table
CREATE TABLE pages (
    page_id INT PRIMARY KEY,
    page_name VARCHAR(200)
);

-- Insert data into pages
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');

-- Create page_likes table
CREATE TABLE page_likes (
    user_id INT,
    page_id INT,
    liked_date DATETIME,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);

-- Insert data into page_likes
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');

select p.page_id from pages p left join page_likes l on p.page_id = l.page_id
where l.page_id is null
