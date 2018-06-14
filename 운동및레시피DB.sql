select *
  from tab;

CREATE TABLE tb_exercise (
    excercise_seq     NUMBER          PRIMARY KEY, 
    excercise_name    VARCHAR2(200)    NOT NULL, 
    excercise_kcal    NUMBER          NOT NULL
);

CREATE TABLE tb_excercise_record (
    user_seq          NUMBER    NOT NULL, 
    excercise_seq     NUMBER    NOT NULL, 
    excercise_time    NUMBER    NOT NULL, 
    excercise_date    DATE      NOT NULL
);

CREATE SEQUENCE s_exercise_seq;

drop table tb_exercise purge;
drop SEQUENCE s_exercise_seq;

insert into tb_exercise values (s_exercise_seq.nextval, '걷기', 4.6);
insert into tb_exercise values (s_exercise_seq.nextval, '물속걷기', 5);
insert into tb_exercise values (s_exercise_seq.nextval, '빠르게걷기', 6.3);
insert into tb_exercise values (s_exercise_seq.nextval, '제자리걷기', 2);
insert into tb_exercise values (s_exercise_seq.nextval, '계단오르기' || '('||'걷기'||')', 7);
insert into tb_exercise values (s_exercise_seq.nextval, '달리기', 13.5);
insert into tb_exercise values (s_exercise_seq.nextval, '수영', 9);
insert into tb_exercise values (s_exercise_seq.nextval, '아령 운동', 7);
insert into tb_exercise values (s_exercise_seq.nextval, '짐볼 운동', 5);
insert into tb_exercise values (s_exercise_seq.nextval, '스쿼트' || '('||'다리 근력운동'||')', 7);
insert into tb_exercise values (s_exercise_seq.nextval, '턱걸이' || '('||'팔 근력운동'||')', 8);
insert into tb_exercise values (s_exercise_seq.nextval, '런지' || '('||'다리 근력운동'||')', 7);
insert into tb_exercise values (s_exercise_seq.nextval, '크런치' || '('||'복부 근력운동'||')', 8);
insert into tb_exercise values (s_exercise_seq.nextval, '힙업' || '('||'엉덩이 근력운동'||')', 8);
insert into tb_exercise values (s_exercise_seq.nextval, '덤벨프레스' || '('||'가슴 근력운동'||')', 8);
insert into tb_exercise values (s_exercise_seq.nextval, '팔굽혀펴기' || '('||'가슴 근력운동'||')', 8);
insert into tb_exercise values (s_exercise_seq.nextval, '에어로빅', 6.1);
insert into tb_exercise values (s_exercise_seq.nextval, '자전거타기', 6.3);
insert into tb_exercise values (s_exercise_seq.nextval, '스피닝', 7);
insert into tb_exercise values (s_exercise_seq.nextval, '춤추기', 4.5);
insert into tb_exercise values (s_exercise_seq.nextval, '테니스', 6.5);
insert into tb_exercise values (s_exercise_seq.nextval, '축구', 8.1);
insert into tb_exercise values (s_exercise_seq.nextval, '골프', 3.8);
insert into tb_exercise values (s_exercise_seq.nextval, '농구', 5.9);
insert into tb_exercise values (s_exercise_seq.nextval, '집청소하기' || '('||'생활운동'||')', 6.3);
insert into tb_exercise values (s_exercise_seq.nextval, '세차하기' || '('||'생활운동'||')', 4.5);
insert into tb_exercise values (s_exercise_seq.nextval, '산책하기' || '('||'생활운동'||')', 3.4);

select *
  from tb_exercise
 order by excercise_seq;
 
select *
  from tb_exercise
 where excercise_name like '%운동%';  
  
  
CREATE TABLE tb_recipe (
    user_seq       NUMBER(3)       NOT NULL, 
    recipe_seq     NUMBER(3)       PRIMARY KEY, 
    title          VARCHAR2(1000)  NOT NULL, 
    content        VARCHAR2(4000)  NOT NULL, 
    recipe_date    DATE            default sysdate, 
    view_count     NUMBER(3)       default 0,
    file_seq       NUMBER(3)       NULL
);

CREATE SEQUENCE s_recipe_seq;
drop table tb_recipe purge;
select *
  from tb_recipe
 order by recipe_seq desc;

insert into tb_recipe (user_seq, recipe_seq, title, content)
values ( 1, s_recipe_seq.nextval, '리코타치즈', '1. 야채샐러드의 기본은 물기를 확실히 털어내는 거겠죠. 신선하고 아삭하게 찬물에 담가두었다가 물기를 빼고 방울토마토는 꼭지를 떼어주면 됩니다.');
insert into tb_recipe (user_seq, recipe_seq, title, content)
values ( 1, s_recipe_seq.nextval, '단호박찜', '1. 야채샐러드의 기본은 물기를 확실히 털어내는 거겠죠. 신선하고 아삭하게 찬물에 담가두었다가 물기를 빼고 방울토마토는 꼭지를 떼어주면 됩니다.');
insert into tb_recipe (user_seq, recipe_seq, title, content)
values ( 2, s_recipe_seq.nextval, '닭가슴살', '1. 야채샐러드의 기본은 물기를 확실히 털어내는 거겠죠. 신선하고 아삭하게 찬물에 담가두었다가 물기를 빼고 방울토마토는 꼭지를 떼어주면 됩니다.');
insert into tb_recipe (user_seq, recipe_seq, title, content)
values ( 3, s_recipe_seq.nextval, '야채샐러드', '1. 야채샐러드의 기본은 물기를 확실히 털어내는 거겠죠. 신선하고 아삭하게 찬물에 담가두었다가 물기를 빼고 방울토마토는 꼭지를 떼어주면 됩니다.');

CREATE TABLE tb_comment (
    user_seq        NUMBER          NOT NULL, 
    recipe_seq      NUMBER          NOT NULL, 
    comment_seq     NUMBER          PRIMARY KEY, 
    comment_text    VARCHAR2(4000)    NOT NULL, 
    comment_date    DATE            default sysdate
);

insert into tb_comment (user_seq, recipe_seq, comment_seq, comment_text)
values ( 26, 27, s_comment_seq.nextval, '신선하고 아삭하게 찬물에 담가두었다가 물기를 빼고 방울토마토는 꼭지를 떼어주면 됩니다.');
insert into tb_comment (user_seq, recipe_seq, comment_seq, comment_text)
values ( 26, 27, s_comment_seq.nextval, '신선하고 아삭하게 찬물에 담가두었다가 물기를 빼고 방울토마토는 꼭지를 떼어주면 됩니다.222');

CREATE SEQUENCE s_comment_seq;
drop table tb_comment purge;
select *
  from tb_comment
 order by comment_seq desc;

CREATE TABLE tb_file (
	recipe_seq       NUMBER(3)   	  NOT NULL,
    file_seq         NUMBER           PRIMARY KEY, 
    file_path        VARCHAR2(500)    NOT NULL, 
    file_ori_name    VARCHAR2(500)    NOT NULL,
    file_sys_name    VARCHAR2(500)    NOT NULL
);

CREATE SEQUENCE tb_file_seq;
drop table tb_file purge;
select *
  from tb_file
 order by file_seq  desc;
 
select *
  from tb_user
 order by user_seq;
 
 
CREATE TABLE tb_exercise_record (
    exercise_record_seq   NUMBER    PRIMARY KEY, 
    user_seq         NUMBER    NOT NULL, 
    exercise_seq     NUMBER    NOT NULL, 
    exercise_time    NUMBER    NOT NULL, 
    exercise_date    DATE      default sysdate
);

drop table tb_exercise_record purge;
CREATE SEQUENCE s_exercise_seq;
CREATE SEQUENCE s_exercise_record_seq;

CREATE TABLE tb_exercise (
    excercise_seq     NUMBER          PRIMARY KEY, 
    excercise_name    VARCHAR2(300)    NOT NULL, 
    excercise_kcal    NUMBER          NOT NULL
);

select *
  from tb_exercise;

select *
  from tb_exercise_record
 order by exercise_date desc;

insert into tb_exercise_record (exercise_record_seq, user_seq, exercise_seq, exercise_time) values (s_exercise_record_seq.nextval, 41, 1, 30);
insert into tb_exercise_record (exercise_record_seq, user_seq, exercise_seq, exercise_time) values (s_exercise_record_seq.nextval, 41, 2, 40);
insert into tb_exercise_record (exercise_record_seq, user_seq, exercise_seq, exercise_time) values (s_exercise_record_seq.nextval, 41, 3, 20);

select r.user_seq, e.excercise_seq, r.exercise_time, r.exercise_date, e.excercise_name, (exercise_time*excercise_kcal) as excercise_kcal
  from tb_exercise_record r
 inner join tb_exercise e
    on r.exercise_seq = e.excercise_seq
 where to_char(exercise_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')
   and user_seq = 41;
   
   
CREATE TABLE tb_stat_exercise (
    user_seq         NUMBER    NOT NULL, 
    exercise_time    NUMBER    NULL, 
    exercise_date    DATE      default sysdate
);

ALTER TABLE tb_stat_exercise ADD(excercise_kcal number default 0);
ALTER TABLE tb_stat_exercise DROP COLUMN excercise_kcal;

drop table tb_stat_exercise purge;

select *
  from tb_stat_exercise
 order by exercise_date desc;
 
update tb_stat_exercise
   set excercise_kcal = '0'
 where user_seq = '96' and exercise_time = '0';
 
delete
  from tb_stat_exercise
 where user_seq = '41' and exercise_time = '145';
 
select *
  from tb_stat;
  
ALTER TABLE tb_stat MODIFY(meal_date date default sysdate);

select *
  from tb_stat
 where user_seq = '1'
   and to_char(meal_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd');


select *
  from tb_meal
 order by meal_date desc;
  
select *
  from TB_USER
 where user_seq = '32';
 
select *
  from tb_stat_exercise
 where to_char(exercise_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')
 order by exercise_date desc
 
SELECT a.name, sum(exercise_time) As total
  FROM ( 
	  	select e.user_seq, e.exercise_time, e.exercise_date, u.name
	  	  from tb_stat_exercise e
	  	 inner join tb_user u
	  	    on e.user_seq = u.user_seq
	  	 where exercise_date between sysdate-6 and sysdate
  	   ) a
 group by a.name
 order by total desc;
 
 select *
  from tb_stat
 where user_seq = '41'
   and to_char(meal_date, 'yyyy-mm-dd') 
       between to_char(sysdate-14, 'yyyy-mm-dd') 
       and to_char(sysdate, 'yyyy-mm-dd')
  order by meal_date;

  
select * from tb_stat_exercise