CREATE TABLE tb_diary
(
    user_seq      NUMBER          NOT NULL, 
    diary_seq     NUMBER          primary key, 
    title         VARCHAR2(4000)    NOT NULL, 
    content       VARCHAR2(4000)    NOT NULL, 
    diary_date    DATE            default sysdate
)


CREATE SEQUENCE tb_diary_SEQ

drop table tb_diary;
drop sequence tb_diary_seq;

select *
from tb_diary;

select *
from tb_diary
where to_char( diary_date, 'yyyymmdd' ) = to_char( sysdate, 'yyyymmdd')