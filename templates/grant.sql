<% users.each do |user| %>
<% permissions.each do |permission| %>
GRANT <%= permission %> on <%= object %> to <%= user %><%= if grant_option == true %>WITH GRANT OPTION<%= end %>;
<% end %>
<% end %>
