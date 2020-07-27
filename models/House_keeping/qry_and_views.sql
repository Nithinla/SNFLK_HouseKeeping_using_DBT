select VIEW_NAME, VIEW_DEFINITION, SCHEMA, DATABASE, QUERY_TEXT, END_TIME, 'VIEW' AS TYPE
--TBL.TABLE_NAME AS VIEW_NAME, count(*) as usage_cnt,max(end_TIME) as last_used
from
{{ ref('active_views')}} vw
LEFT JOIN {{ ref('qry_hist')}} ON upper(qry_hist.QUERY_TEXT) like concat(concat('%',VIEW_NAME),'%')
