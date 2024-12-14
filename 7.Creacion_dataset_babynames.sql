DROP TABLE unique_name_counts;

Create table unique_name_counts as
SELECT 
    first_name,
    sex,
    COUNT(*) as repetitions
FROM
    baby_names
group by
first_name, sex;