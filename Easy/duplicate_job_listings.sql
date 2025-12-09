/*Assume you're given a table containing job postings from various companies on the LinkedIn platform. 
Write a query to retrieve the count of companies that have posted duplicate job listings.

Definition:

Duplicate job listings are defined as two job listings within the same company that share identical 
titles and descriptions.*/

-- Create job_listings table
CREATE TABLE job_listings (
    job_id INT,
    company_id INT,
    title VARCHAR(255),
    description TEXT
);

-- Insert data into job_listings
INSERT INTO job_listings (job_id, company_id, title, description) VALUES
(248, 827, 'Business Analyst',
 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
(149, 845, 'Business Analyst',
 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
(945, 345, 'Data Analyst',
 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
(164, 345, 'Data Analyst',
 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
(172, 244, 'Data Engineer',
 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.');


with cte as (
  select *, row_number() over(partition by company_id, title, description) as rn
  from job_listings)
  
  select (select count(*) from job_listings) - count(*) as duplicate_companies
  from cte where rn = 1
