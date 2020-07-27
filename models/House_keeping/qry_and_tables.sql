select TABLE_NAME, SCHEMA, DATABASE, QUERY_TEXT, END_TIME, 'TABLE' AS TYPE
--TBL.TABLE_NAME AS VIEW_NAME, count(*) as usage_cnt,max(end_TIME) as last_used
from
{{ ref('active_base_tables')}} tbl
LEFT JOIN {{ ref('qry_hist')}} ON upper(qry_hist.QUERY_TEXT) like concat(concat('%',TABLE_NAME),'%')
