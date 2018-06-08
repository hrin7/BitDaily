select *
from tb_recipe;

select user_seq, count(user_seq)
from (select * from tb_recipe where recipe_date between to_date('2018-06-07')and to_date('2018-06-10') )
group by user_seq;