
DROP VIEW IF EXISTS powerbi_provider_pressure;
DROP VIEW IF EXISTS powerbi_specialty_pressure;
DROP VIEW IF EXISTS powerbi_region_icb_pressure;
DROP VIEW IF EXISTS powerbi_ae_provider_performance;
DROP VIEW IF EXISTS powerbi_rtt_provider_waiting_times;

CREATE VIEW powerbi_provider_pressure AS
SELECT
    provider_code,
    provider_name,
    icb_code,
    icb_name,
    region_name,
    reporting_period,
    total_incomplete_pathways,
    total_within_18_weeks,
    total_52_plus_weeks,
    total_65_plus_weeks,
    total_78_plus_weeks,
    average_median_wait_weeks,
    average_92nd_percentile_wait_weeks,
    treatment_functions_count,
    percent_within_18_weeks_calculated,
    percent_52_plus_weeks,
    total_ae_attendances,
    attendances_under_4_hours,
    attendances_over_4_hours,
    total_emergency_admissions,
    patients_waiting_over_4_hours_after_decision_to_admit,
    patients_waiting_over_12_hours_after_decision_to_admit,
    percent_ae_under_4_hours,
    percent_ae_over_4_hours,
    CASE
        WHEN total_incomplete_pathways >= 100000 THEN 'Very High Waiting List'
        WHEN total_incomplete_pathways >= 50000 THEN 'High Waiting List'
        WHEN total_incomplete_pathways >= 10000 THEN 'Medium Waiting List'
        ELSE 'Lower Waiting List'
    END AS waiting_list_pressure_group,
    CASE
        WHEN percent_within_18_weeks_calculated >= 0.70 THEN 'Stronger RTT Performance'
        WHEN percent_within_18_weeks_calculated >= 0.60 THEN 'Moderate RTT Performance'
        ELSE 'Lower RTT Performance'
    END AS rtt_performance_group,
    CASE
        WHEN percent_ae_under_4_hours >= 0.76 THEN 'Stronger A&E Performance'
        WHEN percent_ae_under_4_hours >= 0.65 THEN 'Moderate A&E Performance'
        ELSE 'Lower A&E Performance'
    END AS ae_performance_group
FROM provider_pressure_summary;

CREATE VIEW powerbi_specialty_pressure AS
SELECT
    treatment_function_code,
    treatment_function,
    reporting_period,
    total_incomplete_pathways,
    total_within_18_weeks,
    total_52_plus_weeks,
    total_65_plus_weeks,
    total_78_plus_weeks,
    average_median_wait_weeks,
    average_92nd_percentile_wait_weeks,
    provider_count,
    percent_within_18_weeks,
    percent_52_plus_weeks,
    percent_65_plus_weeks,
    percent_78_plus_weeks,
    CASE
        WHEN total_incomplete_pathways >= 500000 THEN 'Very High Specialty Pressure'
        WHEN total_incomplete_pathways >= 250000 THEN 'High Specialty Pressure'
        WHEN total_incomplete_pathways >= 100000 THEN 'Medium Specialty Pressure'
        ELSE 'Lower Specialty Pressure'
    END AS specialty_pressure_group
FROM specialty_pressure_summary;

CREATE VIEW powerbi_region_icb_pressure AS
SELECT
    region_name,
    icb_name,
    reporting_period,
    provider_count,
    total_incomplete_pathways,
    total_within_18_weeks,
    total_52_plus_weeks,
    total_65_plus_weeks,
    total_78_plus_weeks,
    total_ae_attendances,
    attendances_under_4_hours,
    attendances_over_4_hours,
    total_emergency_admissions,
    patients_waiting_over_4_hours_after_decision_to_admit,
    patients_waiting_over_12_hours_after_decision_to_admit,
    percent_within_18_weeks,
    percent_52_plus_weeks,
    percent_ae_under_4_hours,
    percent_ae_over_4_hours
FROM region_icb_pressure_summary;

CREATE VIEW powerbi_ae_provider_performance AS
SELECT
    provider_code,
    provider_name,
    region,
    reporting_period,
    total_attendances,
    attendances_under_4_hours,
    attendances_over_4_hours,
    percent_under_4_hours,
    total_emergency_admissions,
    patients_waiting_over_4_hours_after_decision_to_admit,
    patients_waiting_over_12_hours_after_decision_to_admit,
    data_source
FROM ae_provider_performance;

CREATE VIEW powerbi_rtt_provider_waiting_times AS
SELECT
    provider_code,
    provider_name,
    region_code,
    treatment_function_code,
    treatment_function,
    reporting_period,
    total_incomplete_pathways,
    within_18_weeks,
    percent_within_18_weeks,
    median_wait_weeks,
    percentile_92_wait_weeks,
    wait_52_plus_weeks,
    wait_65_plus_weeks,
    wait_78_plus_weeks,
    data_source
FROM rtt_provider_waiting_times;
