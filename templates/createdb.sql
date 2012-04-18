create database <%= name %>
USER SYS IDENTIFIED BY <%= sys_password %>
USER SYSTEM IDENTIFIED BY <%= system_password %>
logfile group 1 ('<%= oradata %>/<%= name %>/redo1.log') size 100M,
        group 2 ('<%= oradata %>/<%= name %>/redo2.log') size 100M,
        group 3 ('<%= oradata %>/<%= name %>/redo3.log') size 100M,
        group 4 ('<%= oradata %>/<%= name %>/redo4.log') size 100M,
        group 5 ('<%= oradata %>/<%= name %>/redo5.log') size 100M
character set <%= charset %>
national character set <%= national_charset %>
datafile '<%= oradata %>/<%= name %>/system.dbf' size 500M autoextend on next 10M maxsize unlimited extent management local
sysaux datafile '<%= oradata %>/<%= name %>/sysaux.dbf' size 100M autoextend on next 10M maxsize unlimited
undo tablespace undotbs1 datafile '<%= oradata %>/<%= name %>/undotbs1.dbf' size 100M
default temporary tablespace temp tempfile '<%= oradata %>/<%= name %>/emp01.dbf' size 100M;
