drop table if exist catalogs;
create table catalogs
(
--     id   int unsigned not null primary key auto_increment,
    id serial primary key,
    name varchar(255) comment 'Название раздела',
    unique unique_name(name(10))
--     primary key(id, name(10))
) comment= 'Разделы интернет магазина';

drop table if exist users;
create table users
(
    id   serial primary key,
    name varchar(255) comment 'Имя покупателя',
    birthday_at DATE comment 'Дата рождения',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment= 'Покупатели';

drop table if exists products;
create table products
(
    id          serial primary key,
    name        varchar(255) comment 'Название',
    description text comment 'Описание',
    price       decimal(11, 2) comment 'Цена',
    catalog_id  int unsigned,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    key index_of_catalog_id(catalog_id)
) comment = 'Товарные позиции';

-- create index index_of_catalog_id using btree/hash on products (catalog_id);
-- drop index index_of_catalog_id on products (catalog_id);

drop table if exists orders;
create table orders
(
    id          serial primary key,
    user_id int unsigned,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    key index_of_user_id(user_id)
) comment = 'Заказы';

drop table if exists orders_products;
create table orders_products
(
    id          serial primary key,
    order_id   int unsigned,
    product_id int unsigned,
    total      int unsigned default comment 'Количество заказанных товарных позиций',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
--     key order_id(order_id, product_id),
--     key product_id(product_id, order_id)
) comment= 'Состав заказа';

drop table if exists discounts;
create table discounts
(
    id          serial primary key,
    user_id    int unsigned,
    product_id int unsigned,
    discount   float unsigned comment 'Величина скидки от 0,0 до 1,0',
    started_at datetime,
    finished_at datetime,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    key index_of_user_id(user_id),
    key index_of_product_id(product_id)
) comment = 'Скидки';

drop table if exists storehouses;
create table storehouses
(
    id          serial primary key,
    name    varchar(255) comment  'Название',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Склады'

drop table if exists storehouses_products;
create table storehouses_products
(
    id          serial primary key,
    storehouse_id    int unsigned,
    product_id int unsigned,
    value   int unsigned comment 'Запас товарной позиции на складе',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Запасы на складе'