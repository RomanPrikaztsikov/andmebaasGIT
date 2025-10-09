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