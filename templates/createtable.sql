CREATE TABLE <%= name %>
(
<% fields.each do |field| %><%= field %>,
<% end %>
)
;
<% grant_to_users.each do |user| %>
GRANT SELECT on <%= name %> to <%= user %>;
<% end %>
quit

