CREATE OR REPLACE PACKAGE <%= schema %>.<%= name %> AS
<% procedures.each do |proc| -%>
   PROCEDURE <%= proc %>;
<% end -%>
END <%= name %>;
/

