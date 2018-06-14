
CREATE TABLE tb_meal_detail
(
    meal_seq           NUMBER         NOT NULL, 
    meal_detail_seq    NUMBER         NOT NULL, 
    meal_type          VARCHAR2(5)    NOT NULL, 
    reg_time           DATE           NOT NULL, 
    food_seq           NUMBER         NOT NULL, 
    meal_gram          NUMBER         NOT NULL, 
    file_path          VARCHAR2       NULL, 
    CONSTRAINT TB_MEAL_DETAIL_PK PRIMARY KEY (meal_detail_seq)
)
 
CREATE TABLE tb_stat_weight
(
	weight_seq        NUMBER    NULL,
    user_seq          NUMBER    NOT NULL, 
    current_weight    NUMBER    NULL, 
    goal_weight       NUMBER    NULL, 
    weight_date       DATE      default sysdate, 
    CONSTRAINT TB_STAT_WEIGHT_PK PRIMARY KEY (user_seq, weight_date)
)

/

CREATE TABLE tb_weight_record
(
    user_seq         NUMBER    NOT NULL, 
    record_date      DATE      default sysdate, 
    record_weight    NUMBER    NOT NULL
)
/

CREATE TABLE tb_meal
(
    meal_seq     NUMBER    NOT NULL, 
    user_seq     NUMBER    NOT NULL, 
    meal_date    DATE      NOT NULL, 
    CONSTRAINT TB_MEAL_PK PRIMARY KEY (user_seq, meal_date)
)
/


CREATE SEQUENCE s_meal_no
START WITH 1
INCREMENT BY 1;

CREATE TABLE tb_meal_detail
(
    meal_seq           NUMBER(10)         NOT NULL, 
    meal_detail_seq    NUMBER(10)         NOT NULL, 
    meal_type          VARCHAR2(5)    NOT NULL, 
    reg_time           date default sysdate, 
    food_seq           NUMBER(10)        NOT NULL, 
    meal_gram          NUMBER(5)         NOT NULL, 
    file_path          VARCHAR2(1000)       NULL, 
    CONSTRAINT TB_MEAL_DETAIL_PK PRIMARY KEY (meal_detail_seq)
)
/

CREATE SEQUENCE s_meal_detail_no
START WITH 1
INCREMENT BY 1;
/