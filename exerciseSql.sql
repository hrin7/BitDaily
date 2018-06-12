create table tbl_test_stat_exercise(
	user_seq number(3) not null,
	exercise_time number(6) not null,
	exercise_date date default sysdate
)

insert into tbl_test_stat_exercise values (1,50,to_date('2018-06-01'));
insert into tbl_test_stat_exercise values (1,50,to_date('2018-06-02'));
insert into tbl_test_stat_exercise values (1,50,to_date('2018-06-03'));
insert into tbl_test_stat_exercise values (1,50,to_date('2018-06-04'));
insert into tbl_test_stat_exercise values (1,50,to_date('2018-06-05'));
insert into tbl_test_stat_exercise values (2,500,to_date('2018-06-01'));
insert into tbl_test_stat_exercise values (2,10,to_date('2018-06-02'));
insert into tbl_test_stat_exercise values (2,50,to_date('2018-06-03'));

select *
from tb_stat_exercise;

SELECT user_seq, sum(exercise_time) As total
FROM (select * from tb_stat_exercise where exercise_date between to_date('2018-06-01')and to_date('2018-06-12'))
group by user_seq
order by total desc;

update tb_exercise_record
set		exercise_time = #{exerciseTime}
where user_seq = 41
and exercise_record_seq = #{exerciseRecordSeq}

