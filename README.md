# 🏅 Olympics SQL Data Analysis Project

This project analyzes historical Olympic data using structured SQL queries. It explores trends in athlete participation, medal counts, sport popularity, gender representation, and country-wise performance using two primary datasets: **Athlete Events** and **NOC Regions**.

---

## 📁 Dataset Description

### 1. `athlete_events.csv`
Contains records of every athlete who participated in the Olympics from 1896 to 2016.
- Fields include: Name, Sex, Age, Height, Weight, Team, NOC, Games, Year, Season, City, Sport, Event, Medal.

### 2. `noc_regions.csv`
Maps National Olympic Committee (NOC) codes to regions (countries).

---

## 🔍 Objectives & Key Questions

The project addresses the following analytics questions:

### 📌 Basic Analysis
- How many Olympic games were held in each year?
- Total number of male vs female athletes.
- Number of countries that participated.
- Top 5 sports with the most events.

### 📌 Intermediate Analysis
- Total medals won by each country.
- Top medal-winning athletes.
- Year-wise medal count for a specific country (e.g., India).
- Gender-wise medal distribution by country.

### 📌 Advanced Analysis (with JOIN)
- Countries with the highest gold medal percentage.
- Most diverse sports by participating countries.
- First year a country won a medal.
- Top-performing sports and athletes over the years.

---

## 🧠 SQL Concepts Used
- `JOIN`, `GROUP BY`, `ORDER BY`
- Aggregate functions: `COUNT()`, `SUM()`, `MIN()`, `MAX()`
- Conditional logic using `CASE WHEN`
- Filtering with `WHERE`, `HAVING`
- Sorting and limiting results

---

## 📊 Tools Used
- **SQL (MySQL/PostgreSQL)** for data querying

---

