# Cyclistic Bike-Share Analysis
### Google Data Analytics Certificate - Capstone Case Study

## Project Overview
This case study analyzes 12 months of Cyclistic bike-share trip data to identify behavioral differences between casual riders and annual members. The insights are used to develop marketing recommendations aimed at converting casual riders into long-term members.

## Business Task
**How do annual members and casual riders use Cyclistic bikes differently?**

## Tools Used
- **Google BigQuery** — data cleaning and analysis
- **Tableau Public** — data visualization
- **Google Slides** — presentation

## Data Source
12 months of Cyclistic trip data (May 2024 – April 2026)
https://divvy-tripdata.s3.amazonaws.com/index.html

## Key Findings
- 🚴 **Casual riders take 70% longer rides** than members on average (21 min vs 12 min)
- 📅 **Casual riders peak on weekends**, while members ride consistently on weekdays
- ⏰ **Members show clear rush hour spikes** at 8am and 5pm — casual riders do not
- ☀️ **Both groups peak in summer**, but members maintain higher ridership year-round
- ⚡ **Electric bikes are preferred** by both groups, with casual riders showing a stronger preference

## Recommendations
1. **Weekend Membership Tier** - a lower-cost weekend-only membership targeting casual riders' existing habits
2. **Off-Peak Membership Tier** - an off-peak membership (10am–4pm) for leisure riders who avoid rush hour
3. **Ride Length Loyalty Program** - reward longer rides with points or discounts toward a membership upgrade

## Files in this Repository
| File | Description |
|------|-------------|
| `sql/cleaning.sql` | Data cleaning queries in BigQuery |
| `sql/analysis.sql` | Analysis queries in BigQuery |
| `visualizations/` | Exported chart images from Tableau |
| `report/` | Full case study report |

## Visualizations
[View the interactive dashboard on Tableau Public](https://public.tableau.com/views/CyclisticCaseStudy_17786124197600/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
