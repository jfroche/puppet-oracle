CREATE TABLESPACE <%= tablespace %>;
ALTER TABLESPACE <%= tablespace %>
    ADD DATAFILE '<%= path %>' SIZE <%= initial_size %>
      AUTOEXTEND <%= auto_extend %>
      NEXT <%= next_extend_size %>
      MAXSIZE <%= max_size %>;
