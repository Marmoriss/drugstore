-- (관리자계정) drugstore 일반계정 생성
alter session set "_oracle_script" = true;

create user drugstore
identified by drugstore
default tablespace users;

alter user drugstore quota unlimited on users;

grant connect, resource to drugstore;

commit;