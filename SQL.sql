--user 시퀀시
create sequence s_user_no;

-- user 테이블 생성
CREATE TABLE tb_user(
    user_seq          NUMBER(10)          NOT NULL, 
    id                VARCHAR2(20)        NOT NULL, 
    name              VARCHAR2(20)        NOT NULL, 
    pass              VARCHAR2(20)    NOT NULL, 
    email             VARCHAR2(20)    NOT NULL, 
    age               NUMBER(3)   	  NOT NULL, 
    user_height       NUMBER(3)          NOT NULL, 
    user_weight       NUMBER(3)         NOT NULL, 
    gender            char(1)            NOT NULL, 
    goal_weight       NUMBER(3)          NOT NULL, 
    goal_calorie      NUMBER(3)          NOT NULL, 
    current_weight    NUMBER(3)          NOT NULL, 
    CONSTRAINT TB_USER_PK PRIMARY KEY (user_seq)   
);
--user정보 insert
insert into tb_user (user_seq, id, name, pass, email, age, user_height, user_weight, gender, goal_weight, goal_calorie, current_weight)
	values (s_user_no.nextval,'id1', 'hong','id1', 'asd@na.com', 38, 180, 78, 'M', 68, 6, 77 );
insert into tb_user (user_seq, id, name, pass, email, age, user_height, user_weight, gender, goal_weight, goal_calorie, current_weight)
	values (s_user_no.nextval,'song', 'song', 'song', 'zzz@zz.com', 35, 182, 88, 'M', 80, 8, 88 );

insert into tb_stat (
	meal_seq, user_seq, morning, lunch, diner, snack
	) values (200, 26, 200, 500, 1000, 10
	);
	
select *
  from tb_stat;
	
	
select *
  from tb_meal;
  
insert into tb_meal (
	meal_seq, user_seq, meal_date
	) values (200, 26,'18/06/8'
	);	
  
--유저 정보
select *
  from tb_user;
	
--유저 시퀀시 삭제	
drop sequence s_user_no;
-- 유저 테이블 삭제
drop table tb_user purge;
-- 유저 정보 삭제
delete tb_user;













