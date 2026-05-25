-- Change the column type permanently 
ALTER TABLE macro_news_sentiment
modify column date DATE;

-- Convert text to a real Date format
UPDATE macro_news_sentiment
SET date = str_to_date(date, '%Y-%m-%d');

-- Remove records where both policy rate and inflation data are missing
DELETE FROM rates_vs_cpi_panel
WHERE policy_rate IS NULL AND cpi_yoy_pct IS NULL;

-- Calculate the real interest rate where it is currently missing
UPDATE rates_vs_cpi_panel
SET real_rate_pct = (policy_rate - cpi_yoy_pct)
WHERE real_rate_pct IS NULL;

-- Add a new column to store the label
ALTER TABLE macro_news_sentiment
ADD COLUMN sentiment_type VARCHAR(20);

-- Populate policy_stance based on hawkish or dovish flags
UPDATE macro_news_sentiment
SET sentiment_type = CASE
	WHEN is_hawkish = 1 THEN 'Hawkish'
    WHEN is_dovish = 1 THEN 'Dovish'
    ELSE 'Neutral'
END;

-- Create a view to unpivot wide country rate columns into a long format for Power BI
CREATE OR REPLACE VIEW vw_normalized_global_rates AS
SELECT date, 'USA' AS economy, fed_funds_rate AS policy_rate
FROM central_bank_rates UNION ALL
SELECT date, 'Europe', ecb_deposit_rate FROM central_bank_rates
UNION ALL
SELECT date, 'UK', boe_base_rate FROM central_bank_rates
UNION ALL
SELECT date, 'India', rbi_repo_rate FROM central_bank_rates
UNION ALL
SELECT date, 'Japan', japan_policy_rate FROM central_bank_rates
UNION ALL
SELECT date, 'Canada', canada_policy_rate FROM central_bank_rates
UNION ALL
SELECT date, 'Australia', australia_policy_rate FROM central_bank_rates;

-- Verify if any duplicate date-economy pairs exist in the panel data
SELECT date, economy, count(*) FROM rates_vs_cpi_panel 
GROUP BY date, economy HAVING count(*) > 1;