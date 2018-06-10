select *
  from tab;
  
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
 order by exercise_date;

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

drop table tb_stat_exercise purge;
select *
  from tb_stat_exercise;
