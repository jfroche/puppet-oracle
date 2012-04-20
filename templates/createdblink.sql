CREATE DATABASE LINK <%= name %>
   CONNECT TO <%= remote_username %> IDENTIFIED BY <%= remote_password %>
   USING '<%= service_name %>';
