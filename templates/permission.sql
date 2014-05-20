<%- permissions.each_pair do |user, value_permissions| -%>
<%- value_permissions.each_pair do |permission, value_user| -%>
<%- value_user.each_pair do |object, value_hash| -%>
<%- if value_hash['ensure'] == 'present' -%>
GRANT <%= permission %> ON <%= object %> TO <%= user %><% if value_hash.has_key?('grant') %><% if value_hash['grant'] %> WITH GRANT OPTION<% end %><% end %>;
<%- else -%>
REVOKE <%= permission %> ON <%= object %> FROM <%= user %>;
<%- end -%>
<%- end -%>
<% end %>
<%- end -%>
