create table tbl_test_user(
	user_seq number(3) not null,
	goal_weight number(3) not null,
	current_weight number(3) not null,
	weight_date date default sysdate
)
drop table tbl_test_user;


create sequence tbl_test_user_seq;

drop sequence tbl_test_user_seq;


insert into tbl_test_user values (1,40,50,to_date('2018-06-01','yyyy-MM-dd'));
insert into tbl_test_user values (1,40,55,to_date('2018-06-02','yyyy-MM-dd'));
insert into tbl_test_user values (1,40,60,to_date('2018-06-03','yyyy-MM-dd'));
insert into tbl_test_user values (1,40,65,to_date('2018-06-04','yyyy-MM-dd'));
insert into tbl_test_user values (1,40,70,to_date('2018-06-05','yyyy-MM-dd'));
insert into tbl_test_user values (2,40,50,to_date('2018-06-01','yyyy-MM-dd'));
insert into tbl_test_user values (2,40,55,to_date('2018-06-02','yyyy-MM-dd'));
insert into tbl_test_user values (2,40,60,to_date('2018-06-03','yyyy-MM-dd'));
insert into tbl_test_user values (2,40,65,to_date('2018-06-04','yyyy-MM-dd'));

select *
from tbl_test_user;

select *
from tbl_test_user
where weight_date between to_date('2018-06-01') and to_date('2018-06-05')
order by weight_date desc;



SELECT user_seq, (current_weight - goal_weight) AS weight
FROM tb_stat_weight
WHERE (user_seq, TO_CHAR (weight_date, 'yyyy-mm-dd')) IN
	( SELECT user_seq, TO_CHAR (MAX (weight_date), 'yyyy-mm-dd') weight
	  FROM tb_stat_weight
	  WHERE weight_date BETWEEN TO_DATE ('2018-06-01')
	  AND TO_DATE ('2018-06-12')
	  GROUP BY user_seq)
ORDER BY weight;

select *
  from tb_weight_record;
select *
  from tb_user;
  
  
select *
from tb_stat_weight;

	
	  	   
SELECT a.name as name, (current_weight - goal_weight) AS total
where (user_seq, TO_CHAR (weight_date, 'yyyy-mm-dd')) in ( 
		SELECT user_seq, TO_CHAR (MAX (weight_date), 'yyyy-mm-dd') weight
	  	FROM tb_stat_weight
	  	WHERE weight_date BETWEEN TO_DATE ('2018-06-01')
	  	AND TO_DATE ('2018-06-01')
	  	GROUP BY user_seq)	  	   
group by a.name
order by total desc



SELECT a.name as name, (current_weight - goal_weight) As total
where ( 
	select e.user_seq, e.current_weight e.goal_weight , u.name
	from tb_stat_weight e
	inner join tb_user u
	on e.user_seq = u.user_seq
	where e.weight_date between TO_DATE ('2018-06-01') and TO_DATE ('2018-06-12')
	) a
group by a.name
order by total desc

select *
from tb_stat_weight e
inner join tb_user u
on e.user_seq = u.user_seq
where e.weight_date between TO_DATE ('2018-06-01') and TO_DATE ('2018-06-12');

select *
from tb_stat_weight;

select *
from tb_user;


SELECT a.name as name, sum(exercise_time) As total
	  FROM ( 
		  	select e.user_seq, e.exercise_time, e.exercise_date, u.name
		  	  from tb_stat_exercise e
		  	 inner join tb_user u
		  	    on e.user_seq = u.user_seq
		  	 where exercise_date between TO_DATE ('2018-06-01') and TO_DATE ('2018-06-12')
	  	   ) a
group by a.name
order by total desc

SELECT  a.name as name, (w.current_weight - w.goal_weight) AS weight
FROM (
		SELECT w.user_seq, TO_CHAR (MAX (w.weight_date), 'yyyy-mm-dd') weight, u.name
	  	FROM tb_stat_weight w
	  	inner join tb_user u
	  	on w.user_seq = u.user_seq
	  	group by w.user_seq
	  	having weight_date BETWEEN TO_DATE ('2018-06-01') AND TO_DATE ('2018-06-12')
	  ) a
group by a.name	  
ORDER BY weight;


select *
from	(	
		SELECT w.user_seq, w.weight_date , w.current_weight, w.goal_weight, u.name
		FROM tb_stat_weight w
  		inner join tb_user u
  		on w.user_seq = u.user_seq
  		where w.weight_date BETWEEN TO_DATE ('2018-06-01') AND TO_DATE ('2018-06-12')
  		) a

	
SELECT (select name from tb_user where user_seq = t.user_seq) as user_name, (current_weight - goal_weight) AS weight
FROM tb_stat_weight t
WHERE (user_seq, TO_CHAR (weight_date, 'yyyy-mm-dd')) IN
	( 
		SELECT user_seq,
		TO_CHAR (MAX (weight_date), 'yyyy-mm-dd') weight
		FROM tb_stat_weight
		WHERE weight_date BETWEEN TO_DATE ('2018-06-10')
		AND TO_DATE ('2018-06-12')
		GROUP BY user_seq
	)
ORDER BY weight;


SELECT u.name, (w.current_weight - w.goal_weight) AS weight
FROM tb_stat_weight w
inner join tb_user u
on w.user_seq = u.user_seq
group by (user_seq, TO_CHAR (weight_date, 'yyyy-mm-dd')) IN
	( 
	SELECT user_seq,
	TO_CHAR (MAX (weight_date), 'yyyy-mm-dd') weight
	FROM tb_stat_weight
	WHERE weight_date BETWEEN TO_DATE ('2018-06-01')
	AND TO_DATE ('2018-06-12')
	GROUP BY user_seq
	)
ORDER BY weight;


select *
from tb_stat_weight