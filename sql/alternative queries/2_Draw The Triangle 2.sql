
delimiter $$ -- check: https://dev.mysql.com/doc/refman/8.4/en/stored-programs-defining.html
create procedure P()
begin
    declare i int default 1;
    while i<=20 do
        select if(i = 1, '*', repeat('* ', i));
        set i = i+1;    
    end while;
end$$

delimiter ;

call P();
