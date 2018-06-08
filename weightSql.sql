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
FROM tb_user
WHERE (user_seq, TO_CHAR (weight_date, 'yyyy-mm-dd')) IN
( SELECT user_seq,
TO_CHAR (MAX (weight_date), 'yyyy-mm-dd') weight
FROM tb_user
WHERE weight_date BETWEEN TO_DATE ('2018-06-01')
AND TO_DATE ('2018-06-05')
GROUP BY user_seq)
ORDER BY weight;

