SELECT  VIEW_NAME AS NAME,
 SCHEMA,
 DATABASE,
 QUERY_TEXT,
 END_TIME,
 TYPE
 FROM
 {{ ref('qry_and_views')}}

 UNION

 SELECT  TABLE_NAME AS NAME,
 SCHEMA,
 DATABASE,
 QUERY_TEXT,
 END_TIME,
 TYPE
 FROM
 {{ ref('qry_and_tables')}}
