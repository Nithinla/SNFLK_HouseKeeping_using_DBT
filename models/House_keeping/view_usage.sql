{{ config(materialized='view') }}
select NAME, DATABASE, SCHEMA, COUNT(QUERY_TEXT) AS USAGE_CNT, MAX(END_TIME) AS LAST_USED
from
{{ ref('queries_with_metadata')}}
where TYPE = 'VIEW'
group by
TYPE,NAME, DATABASE, SCHEMA
