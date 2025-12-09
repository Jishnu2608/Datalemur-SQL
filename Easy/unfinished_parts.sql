/*Tesla is investigating production bottlenecks and they need your help to extract the relevant data. \
Write a query to determine which parts have begun the assembly process but are not yet finished.

Assumptions:
1. parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
2. An unfinished part is one that lacks a finish_date.*/

CREATE TABLE parts_assembly (
    part VARCHAR(100),
    finish_date DATETIME,
    assembly_step INT
);

-- Insert data into parts_assembly
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO parts_assembly (part, finish_date, assembly_step) VALUES
('battery', '2022-01-22 00:00:00', 1),
('battery', '2022-02-22 00:00:00', 2),
('battery', '2022-03-22 00:00:00', 3),
('bumper',  '2022-01-22 00:00:00', 1),
('bumper',  '2022-02-22 00:00:00', 2),
('bumper',  NULL, 3),
('bumper',  NULL, 4);

SELECT part, assembly_step from parts_assembly where finish_date is null