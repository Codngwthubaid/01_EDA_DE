/*
Question :
What are the most in demand skills for data engineers?
- Indentify the top 10 in demand skills for data engineers
- Focus on remote job postings 
- Why ?
-- Retrieves the top 10 skills with the highest demand in the remote job market, providing insights the most valuable skills for data engineers seeking remote work
*/

-- helper queries
-- SELECT DISTINCT * FROM skills_dim LIMIT 10;
-- SELECT DISTINCT job_title_short FROM job_postings_fact LIMIT 10;


SELECT  
    sd.skills AS skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = true
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10;


/*
Here is the breakdown of the most demanded skills for data engineers:
SQL and Python are the most in-demand skills, with around 29000 job postings each, nearly double the Cloud platforms. While AWS leading with around ~18000 postings, Azure with ~14000. Apache spark comes under top 5 rank with around ~13000 postings, highlighting the importance of big data processing skills.

Key takeaways :
- SQL and Python remains the most in-demand and functions skills for data engineers
- Cloud Platforms (AWS, Azure) remains critical for modern data engineers.
- Big data processing tools such as Apache Spark comes under highly valuable skills
- Data pipeline tools such as (Airflow, Snowflake) show growing demand
- Java and GCP also comes under top demanded skills 
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
*/