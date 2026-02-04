# netflix-data-analysis-sql
SQL-based Data Analytics project on Netflix dataset to analyze movies, TV shows, ratings, genres, release trends, and business insights.
# Netflix Data Analysis using SQL

## 📊 Project Overview
This project focuses on analyzing Netflix movies and TV shows data using SQL.
The goal is to extract meaningful insights such as content distribution, ratings,
genres, release trends, and country-wise analysis.

This project is suitable for **Data Analyst / SQL Developer / Business Analyst** roles.

---

## 📂 Project Structure
netflix-data-analysis-sql/
│
├── dataset/
│   └── netflix_titles.csv
│
├── sql_queries/
│   └── NETFLIX_TITLES.sql
│
├── insights/
│   └── analysis_summary.md
│
├── screenshots/
│   └── query_results.png
│
├── README.md
└── LICENSE

---

---

## 🛠 Tools & Technologies
- SQL (MySQL / PostgreSQL compatible)
- CSV Dataset
- GitHub for version control

---

## 📁 Dataset Information
- Dataset Name: Netflix Titles
- Content: Movies & TV Shows
- Attributes include:
  - Title
  - Type (Movie / TV Show)
  - Director
  - Cast
  - Country
  - Release Year
  - Rating
  - Duration
  - Genre

---

## 🔍 Key Analysis Performed
- Count of Movies vs TV Shows
- Most common content ratings
- Content released by year
- Country-wise content distribution
- Popular genres on Netflix
- Movies released in specific years
- TV Shows with multiple seasons

---

## 🧠 Sample SQL Queries
```sql
-- Count Movies vs TV Shows
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;
