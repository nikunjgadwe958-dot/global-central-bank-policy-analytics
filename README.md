# Global Central Bank Policy Analytics

A Power BI analytics project analyzing global central bank monetary policy, inflation trends, real interest rates, and macro news sentiment across major economies using SQL, Power Query, DAX, and dimensional modeling.

---

## Project Overview

This project explores how central banks responded to inflationary pressure across major global economies by combining macroeconomic indicators with news sentiment intelligence.

The dashboard analyzes monetary policy trends, inflation behavior, real interest rates, and macroeconomic sentiment to provide a holistic view of global policy dynamics.

This project was designed to simulate real-world analytics work involving messy datasets, validation issues, transformation logic, dimensional modeling, KPI design, and executive dashboard storytelling.

---

## Business Problem

Central banks influence inflation, borrowing costs, investment decisions, and market sentiment through monetary policy decisions.

This project aims to answer questions such as:

- How did central bank policy rates evolve over time?
- Which economies maintained the highest inflation levels?
- Were real interest rates positive or negative across different economies?
- How aggressively did central banks tighten policy?
- What was the tone of macroeconomic news coverage?
- Was sentiment predominantly hawkish, dovish, or neutral?

---

## Tools & Technologies Used

- **Power BI**
- **Power Query**
- **DAX**
- **SQL**
- **Dimensional Data Modeling**
- **CSV Data Sources**

---

## Dataset Sources

This project combines multiple datasets from public sources:

- Central bank policy rate data
- Annual CPI inflation data (validated source)
- Macroeconomic news sentiment dataset

**Note:** Multiple raw datasets were evaluated during development. Some were excluded from the final model due to inconsistent definitions, invalid metrics, or data quality issues.

---

## Data Cleaning & Transformation

Key transformation steps performed during development:

- Standardized inconsistent economy naming across datasets
- Resolved datatype mismatches causing failed joins
- Validated inflation metrics and replaced an invalid source dataset
- Filtered relevant economies for analytical consistency
- Unpivoted and reshaped policy rate data
- Built annual macroeconomic fact table
- Created calculated real interest rate metric
- Cleaned sentiment dataset fields
- Removed unnecessary helper tables from final model
- Designed a clean star-schema model

SQL was used for transformation and validation work, while Power Query was used for data shaping and final integration.

---

## Data Model

Final dimensional model follows a star schema architecture.

### Model Structure

- **DateTable** → Shared date dimension
- **Fact_Macro** → Policy rates, inflation, real rates
- **Fact_Sentiment** → News sentiment intelligence

This structure ensures clean filtering, scalable analytics, and professional BI modeling practices.

---

## Key KPIs

### Monetary Policy Dashboard
- Average Policy Rate
- Average Inflation
- Average Real Rate
- Rate Change (Basis Points)
- Countries Covered

### Sentiment Intelligence Dashboard
- Average Sentiment Score
- Hawkish Articles
- Dovish Articles
- Neutral Articles

---

## Dashboard Pages

### 1. Monetary Policy Dashboard

Includes:

- Policy rate trend analysis
- Inflation vs policy response scatter analysis
- Real interest rate heatmap
- Economy inflation comparison

---

### 2. Sentiment Intelligence Dashboard

Includes:

- Sentiment trend over time
- Sentiment distribution analysis
- Top macro news sources
- Hawkish vs dovish source comparison

---

## Key Insights

Some observations from the analysis:

- Several economies maintained negative real interest rates during high inflation periods
- Policy tightening varied significantly across countries
- Inflation remained structurally elevated in certain economies
- News sentiment skewed predominantly negative
- Monetary policy responses were highly asymmetric across regions

---

## Repository Structure

```bash
global-central-bank-policy-analytics/
│
├── README.md
├── Global_Central_Bank_Analytics.pbix
│
├── data/
│   ├── raw datasets
│
├── sql/
│   └── data_transformation.sql
│
├── screenshots/
│   ├── page1_policy_dashboard.png
│   ├── page2_sentiment_dashboard.png
│   └── star_schema_data_model.png
