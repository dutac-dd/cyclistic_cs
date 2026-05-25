-- =============================================
-- CYCLISTIC BIKE-SHARE ANALYSIS
-- Data Analysis
-- Author: Haowei David Du
-- Tool: Google BigQuery
-- =============================================

-- Total rides by member type
SELECT member_casual, COUNT(*) AS total_rides
FROM `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned`
GROUP BY member_casual
-- Result: Casual: 1,563,607 | Member: 2,850,308

-- Average, maximum, and minimum ride length by member type
SELECT
  member_casual,
  AVG(ride_length) AS avg_ride_length,
  MAX(ride_length) AS max_ride_length,
  MIN(ride_length) AS min_ride_length
FROM `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned`
GROUP BY member_casual
-- Result: Casual avg: 1,275.6s (~21 min) | Member avg: 747.8s (~12 min)

-- Rides by day of week
SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides,
  AVG(ride_length) AS avg_ride_length
FROM `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week
-- Result: Casual riders peak on weekends (1=Sunday, 7=Saturday)
-- Members ride most consistently Tuesday-Thursday

-- Rides by month
SELECT
  member_casual,
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(*) AS total_rides
FROM `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned`
GROUP BY member_casual, month
ORDER BY member_casual, month
-- Result: Both groups peak in summer (June-August)
-- Member ridership stays higher year-round

-- Rides by hour of day
SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS hour_of_day,
  COUNT(*) AS total_rides
FROM `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned`
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, hour_of_day
-- Result: Members spike at 8am and 5pm (commute hours)
-- Casual riders gradually increase through the day with no morning spike

-- Rides by bike type
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM `bike-share-case-study-495615.cyclistic_data.all_trips_cleaned`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, rideable_type
-- Result: Electric bikes preferred by both groups
-- Casual riders: 1.37x more ebikes than classic
-- Members: 1.23x more ebikes than classic
