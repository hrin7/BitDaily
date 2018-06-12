select *
from tb_recipe;

select a.name as name ,count(user_seq) as total
from (
	select r.user_seq ,u.name
	from tb_recipe r
	inner join tb_user u
	on r.user_seq = u.user_seq
	where recipe_date 
	between to_date('2018-06-07')and to_date('2018-06-10') 
	) a
group by a.name
order by total desc;

SELECT a.name as name, sum(exercise_time) As total
	  FROM ( 
		  	select e.user_seq, e.exercise_time, e.exercise_date, u.name
		  	  from tb_stat_exercise e
		  	 inner join tb_user u
		  	    on e.user_seq = u.user_seq
		  	 where exercise_date between #{startDate} and #{endDate}
	  	   ) a
group by a.name
order by total desc


select a.name as name ,count(user_seq) as total
		from (
			select r.user_seq ,u.name , r.recipe_date
			from tb_recipe r
			inner join tb_user u
			on r.user_seq = u.user_seq
			where recipe_date 
			between to_date('2018-06-01') and to_date('2018-06-16')
			) a
		group by a.name
		order by total desc
		
		
select *
from tb_recipe;