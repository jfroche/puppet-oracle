create materialized view <%= name %> TABLESPACE USERS STORAGE ( INITIAL 320K NEXT 320k PCTINCREASE 0) USING INDEX TABLESPACE INDX STORAGE ( INITIAL 160k NEXT 160k PCTINCREASE 50) REFRESH <%= refresh_method %> with primary key AS <%= query %>;
<% grant_to_users.each do |user| %>
GRANT SELECT on <%= name %> to <%= user %>;
<% end %>
<% if refresh_group_name != '' %>
exec DBMS_REFRESH.ADD(name => '"<%= refresh_group_schema %>"."<%= refresh_group_name %>"',list => '<%= name.gsub(/(\w+)\.(\w+)/, '"\1"."\2"') %>',lax => TRUE);
<% end %>
quit

