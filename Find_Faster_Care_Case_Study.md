# Find Faster Care Analytics Case Study

## Project Title

Find Faster Care Analytics | NHS RTT Waiting Times, Provider Pressure and Patient Friendly Access Insights

## Project Summary

This project analysed published NHS RTT waiting time and urgent care data for April 2026 to understand provider pressure, treatment specialty waiting times, ICB level system pressure and patient friendly healthcare access insights.

The final output is a four page Power BI dashboard supported by Python data cleaning, PostgreSQL storage, SQL transformation and DAX measures.

The project uses the NHS RTT full CSV extract for April 2026 and corrects a key double counting issue by separating provider total rows from specialty level rows.

## Business Problem

Public NHS waiting time data is available, but it is not always easy for patients, analysts or non technical users to understand.

The key business question was:

How can published NHS waiting time and urgent care data be used to compare provider pressure, identify access delays and support patient friendly healthcare access insights?

## Project Objective

The objective was to create a professional healthcare analytics dashboard that could:

1 | Summarise RTT waiting time and urgent care pressure

2 | Compare NHS providers by RTT incomplete pathway volume and long wait risk

3 | Analyse treatment specialties by volume and 52 plus week wait share

4 | Compare ICB level system pressure

5 | Translate complex healthcare data into plain English insights

6 | Connect the analysis to the Find Faster Care website concept

## Tools Used

Python | PostgreSQL | SQL | Power BI | DAX | Excel

## Data Sources

The project used published NHS data for April 2026, including:

1 | NHS RTT full CSV extract for April 2026

2 | RTT incomplete pathway waiting time data

3 | Treatment function level waiting time data

4 | Provider level waiting time data

5 | ICB level waiting time data

6 | A&E provider performance data

The data was public aggregate healthcare data. No patient level data was used.

## Data Preparation Process

### 1 | Python Data Inspection

Python was used to inspect the NHS RTT full CSV extract and understand its structure.

The raw file contained provider level, commissioner level, RTT part type and treatment function level information.

Main tasks included:

1 | Extracting the NHS full CSV file from a zip folder

2 | Reading the CSV file into Python

3 | Inspecting row counts and column counts

4 | Checking RTT part description values

5 | Checking treatment function names

6 | Identifying weekly waiting time columns

7 | Converting numeric fields correctly

8 | Validating totals against expected NHS RTT figures

## Double Counting Validation

A key issue was identified during validation.

The NHS RTT dataset contains both:

1 | Total treatment function rows

2 | Specialty level treatment function rows

If both are summed together, the RTT incomplete pathway total becomes inflated.

The dashboard was corrected by using:

1 | Treatment Function Name = Total for provider level KPIs

2 | Specialty rows excluding Total for specialty analysis

This prevented the dashboard from double counting RTT pathways.

## Data Cleaning

The cleaning process converted the NHS RTT full CSV into structured analytical tables.

Clean tables created included:

1 | RTT provider waiting times

2 | Provider pressure summary

3 | Specialty pressure summary

4 | Region and ICB pressure summary

5 | Validation summary

The corrected provider level total used in the dashboard was around 7.12M NHS RTT incomplete pathways.

## PostgreSQL Storage

The cleaned CSV files were uploaded into a PostgreSQL database called:

find_faster_care_analytics

This created a more professional analytics workflow than working only from Excel or CSV files.

## SQL Views

SQL views were created to prepare Power BI ready datasets.

Power BI views included:

1 | powerbi_provider_pressure

2 | powerbi_specialty_pressure

3 | powerbi_region_icb_pressure

4 | powerbi_ae_provider_performance

5 | powerbi_rtt_provider_waiting_times

These views helped separate cleaned source data from dashboard ready analytical outputs.

## Power BI Dashboard

Power BI was used to create the final dashboard.

The dashboard included:

1 | KPI cards

2 | Provider ranking charts

3 | Waiting list pressure groups

4 | A&E performance groups

5 | Specialty waiting time comparison

6 | ICB pressure comparison

7 | Patient friendly insight text

## Dashboard Pages

### Page 1 | Executive Overview

The Executive Overview page summarises overall access pressure for April 2026.

It includes:

1 | RTT incomplete pathways

2 | Percentage within 18 weeks

3 | Percentage waiting 52 plus weeks

4 | A&E attendances

5 | A&E under 4 hours percentage

6 | Top providers by RTT incomplete pathways

7 | Provider waiting list pressure groups

8 | A&E performance groups

This page gives a high level view for decision makers.

### Page 2 | Provider Pressure Analysis

The Provider Pressure Analysis page compares NHS providers by RTT incomplete pathway volume, long wait risk and operational pressure.

It includes:

1 | Provider count

2 | RTT incomplete pathways

3 | 52 plus week waits

4 | Average median wait weeks

5 | Top providers by RTT incomplete pathways

6 | Provider pressure scatter map

7 | Region and waiting list pressure slicers

The scatter chart helps identify providers that combine large RTT pathway volume with higher 52 plus week wait share.

### Page 3 | Specialty Waiting Times

The Specialty Waiting Times page analyses treatment functions.

It compares:

1 | High volume specialties

2 | Specialties with higher 52 plus week wait share

This matters because high volume does not always mean highest long wait risk.

The page shows that operational decisions need both volume analysis and risk analysis.

### Page 4 | Find Faster Care Insights

The final page connects the analysis to the Find Faster Care website concept.

It shows how published NHS data could support:

1 | Provider comparison

2 | Specialty waiting time summaries

3 | ICB level pressure indicators

4 | Plain English explanations of public healthcare data

The page also makes clear that the tool should remain independent and should not provide medical advice or claim NHS affiliation.

## Key Findings

### 1 | Around 7.12M NHS RTT incomplete pathways were recorded

April 2026 NHS RTT full CSV data showed around 7.12M incomplete pathways.

This shows the scale of waiting list pressure across providers and treatment specialties.

### 2 | Around 64.9% were within 18 weeks

The dashboard showed that around 64.9% of RTT incomplete pathways were within 18 weeks.

This provides a national access performance indicator.

### 3 | Around 101K pathways were waiting 52 plus weeks

The dashboard showed around 101K pathways waiting 52 plus weeks.

Although this is a smaller share of the total, it represents a significant long wait group.

### 4 | Around 1.41% were waiting 52 plus weeks

The dashboard showed that around 1.41% of RTT incomplete pathways were waiting 52 plus weeks.

This helps compare long wait risk across providers and specialties.

### 5 | A&E under 4 hours performance was around 75.6%

Urgent care pressure was also visible through A&E performance data.

The dashboard showed around 75.6% of A&E attendances completed within 4 hours.

### 6 | Provider pressure is concentrated

A smaller group of large providers accounts for a large share of RTT incomplete pathways.

This supports prioritising providers with both high volume and higher long wait risk.

### 7 | Specialty pressure is not evenly distributed

Treatment functions show different patterns.

Some specialties have high total waiting list size, while others show higher 52 plus week wait share.

Both views are needed for operational analysis.

### 8 | ICB level analysis adds system context

ICB level comparison helps show where system level pressure is higher.

This is useful for regional planning and patient friendly information design.

## Business Recommendations

1 | Prioritise providers with both high RTT incomplete pathway volume and higher 52 plus week wait share.

2 | Monitor treatment specialties separately because volume pressure and long wait risk are not the same.

3 | Use ICB level analysis to understand system level pressure.

4 | Use plain English explanations to make public healthcare data easier to understand.

5 | Avoid presenting the dashboard as medical advice.

6 | Keep the Find Faster Care concept independent and transparent.

7 | Use published data carefully because provider size, specialty mix and regional context affect interpretation.

## Data Quality And Validation

A major improvement in this project was identifying and fixing a double counting issue.

The first version of the dashboard produced an inflated RTT incomplete pathway figure because it summed both total treatment function rows and specialty level rows.

This was corrected by:

1 | Using Treatment Function Name = Total for provider level KPIs

2 | Excluding Treatment Function Name = Total from specialty level analysis

3 | Validating final totals against the NHS RTT full CSV extract

4 | Rebuilding corrected CSV files

5 | Reuploading corrected tables into PostgreSQL

6 | Refreshing the Power BI dashboard

After correction, the dashboard showed around 7.12M NHS RTT incomplete pathways instead of an inflated total.

## Limitations

1 | The data is published monthly data and does not represent live NHS operational performance.

2 | The project uses aggregate public data, not patient level data.

3 | Waiting time performance is influenced by provider size, case mix, specialty mix and regional context.

4 | The dashboard does not advise patients where to seek treatment.

5 | The project is not affiliated with the NHS.

6 | The dashboard should be used for analysis and information only.

7 | A&E indicators and RTT indicators come from different NHS reporting structures, so they should be interpreted carefully when shown together.

## What This Project Demonstrates

This project demonstrates practical ability in:

1 | Healthcare data analysis

2 | Python data cleaning

3 | Data validation

4 | PostgreSQL database handling

5 | SQL view creation

6 | Power BI modelling

7 | DAX measure creation

8 | Dashboard design

9 | KPI reporting

10 | Provider pressure analysis

11 | Specialty waiting time analysis

12 | ICB level analysis

13 | Business recommendation writing

14 | Translating technical data into plain English insights

## Relevance To Career Goals

This project is relevant for:

Business Analyst

Data Analyst

Healthcare Analyst

Operations Analyst

Market Research Analyst

Management Consulting Analyst

It shows the ability to take messy public datasets, clean them, validate the logic, structure them in a database, analyse them and turn the results into clear business insights.

## Portfolio Value

This project is stronger than a basic dashboard because it includes:

1 | Real public healthcare data

2 | Python data cleaning

3 | Double counting validation

4 | PostgreSQL database storage

5 | SQL views

6 | Power BI dashboarding

7 | DAX measures

8 | Healthcare business context

9 | A clear connection to a real website concept

This makes the project suitable for a GitHub portfolio, LinkedIn project section and analyst job applications.

## Disclaimer

This project is independent analysis using published NHS data.

It is not affiliated with the NHS.

It does not provide medical advice.

It is designed for analytics, portfolio and information design purposes only.