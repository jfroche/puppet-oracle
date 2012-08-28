CREATE VIEW <%= name %> AS
<%= sql %>;
<% grant_to_users.each do |user| %>
GRANT SELECT on <%= name %> to <%= user %>;
<% end %>
quit

