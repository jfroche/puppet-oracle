<% users.each do |user| %>
GRANT <%= permission %> on <%= name %> to <%= user %>;
<% end %>
