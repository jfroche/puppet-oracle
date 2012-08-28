CREATE SEQUENCE <%= name %>
   START WITH       <%= startwith %>
   INCREMENT BY     <%= increment_by %>
   MINVALUE         <%= min_value %>
   NOMAXVALUE
   CACHE            20
   NOCYCLE
   NOORDER
;
