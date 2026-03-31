create table post (
    post_id serial primary key ,
    user_id int not null,
    content text,
    tag text[],
    create_at timestamp default current_timestamp,
    is_public boolean default true
);

create table post_like (
    user_id int not null ,
    post_id int not null ,
    liked_at timestamp default current_timestamp,
    primary key (user_id, post_id)
);

insert into post (user_id, content, tag, create_at, is_public)
values (1, 'du lich da nang mua he', array['travel', 'vn'], now() - interval '1 day', true),
       (2, 'hoc machine learning co ban', array['ml', 'ai'], now() - interval '2 days', true),
       (3, 'deep learning voi cnn', array['dl', 'ai'], now() - interval '3 days', false),
       (1, 'du lich ha noi mua thu', array['travel', 'vn'], now() - interval '10 days', true),
       (2, 'hoc nlp va xu ly ngon ngu', array['nlp', 'ai', 'ml'], now() - interval '1 day', true),
       (3, 'viet api bang fastapi', array['backend', 'python'], now() - interval '5 days', true);

insert into post_like (user_id, post_id)
values (1, 2),
       (1, 5),
       (2, 1),
       (2, 5),
       (3, 1),
       (3, 2),
       (3, 5);

-- 1.
-- a.
create index idx_content on post (lower(content));
select *
from post
where is_public = true and lower(content) like '%du lich%';
-- b.
explain analyze
select *
from post
where is_public = true
  and lower(content) like '%du lich%';

-- 2.
-- a.
create index idx_tags on post using gin (tag);
select *
from post
where tag @> array['travel'];
-- b.
explain analyze
select *
from post
where tag @> array['travel'];

-- 3.
-- a.
create index idx_post_recent_public on post (create_at desc) where is_public = true;
select *
from post
where is_public = true and create_at >= now() - interval '7 days'
order by create_at desc;
-- b.
explain analyze
select *
from post
where is_public = true and create_at >= now() - interval '7 days'
order by create_at desc;

-- 4.
-- a.
create index idx_post_user_created on post (user_id, create_at desc);
select *
from post
where user_id in (1, 2, 3) and is_public = true
order by create_at desc
limit 10;
-- b.
explain analyze
select *
from post
where user_id in (1, 2, 3)
  and is_public = true
order by create_at desc
limit 10;