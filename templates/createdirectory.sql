CREATE OR REPLACE DIRECTORY <%= name %> AS '<%= path %>';
GRANT READ, WRITE ON DIRECTORY <%= name %> TO <%= owner %>;
