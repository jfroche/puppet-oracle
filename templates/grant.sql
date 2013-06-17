<% users.each do |user| %>
GRANT <%= permission %> on <%= object %> to <%= user %>;
<% end %>
