BEGIN
DBMS_REFRESH.MAKE (
      name => '<%= schema %>.<%= name %>',
      list => '',
      next_date => SYSDATE,
      interval => 'SYSDATE + 999',
);
END;
