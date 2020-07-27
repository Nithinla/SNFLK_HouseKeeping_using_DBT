select distinct TABLE_NAME, tbl.SCHEMA , tbl.database
from
{{ ref('active_views')}} vw
inner join {{ ref('active_base_tables')}} tbl on vw.VIEW_DEFINITION like concat(concat('%',tbl.TABLE_NAME),'%')
