---- first one  demanded skills

select sd.skill_id,sd.skills,
        count (jpf.*) as demand_count
from job_postings_fact as jpf  
inner join skills_job_dim sjd
    on jpf.job_id = sjd.job_id
inner join skills_dim as sd 
    on sjd.skill_id = sd.skill_id
where job_title_short = 'Data Engineer'
group by sd.skill_id,sd.skills
order by demand_count DESC
limit 10;

┌──────────┬────────────┬──────────────┐
│ skill_id │   skills   │ demand_count │
│  int32   │  varchar   │    int64     │
├──────────┼────────────┼──────────────┤
│        0 │ sql        │       233132 │
│        1 │ python     │       224102 │
│       77 │ aws        │       130205 │
│       74 │ azure      │       128822 │
│       92 │ spark      │       106904 │
│       12 │ java       │        69657 │
│       75 │ databricks │        63012 │
│       73 │ snowflake  │        60379 │
│        7 │ scala      │        57079 │
│       97 │ kafka      │        56410 │
└──────────┴────────────┴──────────────┘
/*
📌 Key Takeaways
🥇 SQL and Python are the most in-demand Data Engineering skills, appearing in over 230K and 224K job postings respectively, making them essential for aspiring data engineers.
☁️ Cloud expertise is a major hiring priority, with AWS and Azure ranking among the top requested technologies across the job market.
⚡ Big data processing remains critical, as Apache Spark continues to be one of the most sought-after frameworks for handling large-scale data workloads.
🚀 Modern data platforms are gaining strong adoption, with Databricks and Snowflake emerging as key technologies in contemporary data engineering ecosystems.
🔄 Successful Data Engineers need a diverse skill set, combining programming languages (Python, Java, Scala), cloud platforms, data warehouses, and streaming technologies like Kafka to build end-to-end data solutions.
*/