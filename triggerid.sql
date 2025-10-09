create trigger trMyFirstTrigger
on database
for create_table
as
begin
print 'new table created'
end

create table test (id int)

alter trigger trMyFirstTrigger
on database 
for create_table, alter_table, drop_table
as
begin
print 'A table was create, modified or deleted'
end

alter trigger trMyFirstTrigger
on database 
for create_table, alter_table, drop_table
as
begin
rollback
print 'You cannot create delete or modify a table'
end

disable trigger trMyFirstTrigger on database

create trigger trMyFirstTrigger
on database
for RENAME
as
begin
print 'you renamed it'
end

create trigger tr_DatabaseScopeTrigger
on database
for create_table, ater_table, drop_table
as
begin
rollback
print 'you cant create modify delete a table in this database'
end


create trigger tr_ServerScopeTrigger
on all server
for create_table, alter_table, drop_table
as
begin
rollback
print 'you cant create modify delete a table on the server at all'
end
