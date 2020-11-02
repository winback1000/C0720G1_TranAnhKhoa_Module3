
use  test;
create table t1 (
id int primary key
);

create table t2 (
id_t2 int primary key,
t1_id int
);
alter table t2
add constraint fk_t1 foreign key (t1_id) references t1 (id) ON DELETE CASCADE;
