create materialized view <%= name %> TABLESPACE USERS STORAGE ( INITIAL 320K NEXT 320k PCTINCREASE 0) USING INDEX TABLESPACE INDX STORAGE ( INITIAL 160k NEXT 160k PCTINCREASE 50) REFRESH FAST with primary key AS select * from <%= name %>@<%= dblink %>;
GRANT SELECT on <%= name %> to <%= grant_to_user %>;
exec DBMS_REFRESH.ADD(name => '"<%= refresh_group_schema %>"."<%= refresh_group_name %>"',list => '"<%= name.gsub(/(\w+)\.(\w+)/, '"\1"."\2"') %>"',lax => TRUE);
quit

