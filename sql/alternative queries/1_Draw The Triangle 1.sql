delimiter $$ -- check: https://dev.mysql.com/doc/refman/8.4/en/stored-programs-defining.html
create procedure P()
begin
    declare i int default 20;
    while i>0 do
        select if(i = 1, '*', repeat('* ', i)); -- repeat '* ' i-1 times, then add a single '*'
        set i = i-1;    
    end while;
end$$

delimiter ;

call P();