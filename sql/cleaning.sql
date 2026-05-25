-- =============================================
-- CYCLISTIC BIKE-SHARE ANALYSIS
-- Data Cleaning
-- Author: Haowei David Du
-- Tool: Google BigQuery
-- =============================================

-- Step 1: Check for null timestamps
SELECT COUNT(*) AS null_timestamp_rows
FROM `bike-share-case-study-495615.cyclistic_data.all_trips`
WHERE started_at IS NULL
OR ended_at IS NULL
-- Result: 0 rows. No action required.

-- Step 2: Check for end time before start time
SELECT COUNT(*) AS time_errors
FROM `bike-share-case-study-495615.cyclistic_data.all_trips`
WHERE ended_at < started_at
-- Result: 29 rows. Removed in final cleaning query.

-- Step 3: Check for rides under 60 seconds
SELECT COUNT(*) AS under_60s
FROM `bike-share-case-study-495615.cyclistic_data.all_trips`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 61
-- Result: 157,212 rows. Removed in final cleaning query.

-- Step 4: Check for rides over 24 hours
SELECT COUNT(*) AS over_24hrs
FROM `bike-share-case-study-495615.cyclistic_data.all_trips`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 86400
-- Result: 5,833 rows. Removed in final cleaning query.

-- Step 5: Final cleaning query
-- Combines all checks and adds ride_length and day_of_week columns
CREATE OR REPLACE TABLE `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned` AS
SELECT
  *,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length,
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week
FROM `bike-share-case-study-495615.cyclistic_data.all_trips`
WHERE
  started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND ended_at > started_at
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 60
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 86400
