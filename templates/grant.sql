<% users.each do |user| %>
<% permissions.each do |permission| %>
GRANT <%= permission %> on <%= object %> to <%= user %>;
<% end %>
<% end %>
