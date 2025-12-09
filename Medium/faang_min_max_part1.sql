/*The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a 
wide array of financial datasets. As a Data Analyst at Bloomberg, you have access to historical data on 
stock performance.

Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.

For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding 
highest and lowest open prices (refer to the Example Output format). Ensure that the results are sorted 
by ticker symbol.*/

CREATE TABLE stock_prices (
    date DATETIME,
    ticker VARCHAR(10),
    open DECIMAL(10,2),
    high DECIMAL(10,2),
    low DECIMAL(10,2),
    close DECIMAL(10,2)
);

-- Insert data into stock_prices
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO stock_prices (date, ticker, open, high, low, close) VALUES
('2023-01-31 00:00:00', 'AAPL', 142.28, 142.70, 144.34, 144.29),
('2023-02-28 00:00:00', 'AAPL', 146.83, 147.05, 149.08, 147.41),
('2023-03-31 00:00:00', 'AAPL', 161.91, 162.44, 165.00, 164.90),
('2023-04-30 00:00:00', 'AAPL', 167.88, 168.49, 169.85, 169.68),
('2023-05-31 00:00:00', 'AAPL', 176.76, 177.33, 179.35, 177.25);

with cte as (
	select ticker, 
    first_value(date) over(partition by ticker order by open desc) as highest_month,
    first_value(open) over(partition by ticker order by open desc) as highest_open,
    first_value(date) over(partition by ticker order by open) as lowest_month,
    first_value(open) over(partition by ticker order by open) as lowest_open
    from stock_prices)
select distinct ticker, concat(left(monthname(highest_month),3),'-',year(highest_month)) as highest_mth, 
						highest_open,
                        concat(left(monthname(lowest_month),3),'-',year(lowest_month)) as lowest_mth,
                        lowest_open
			from cte order by ticker;
