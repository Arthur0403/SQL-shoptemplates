drop table if exist catalogs;
create table catalogs
(
    id   int unsigned,
    name varchar(255) comment 'Название раздела'
) comment= 'Разделы интернет магазина';

drop table if exist users;
create table users
(
    id   int unsigned,
    name varchar(255) comment 'Имя покупателя'
) comment= 'Покупатели';

drop table if exists products;
create table products
(
    id          int unsigned,
    name        varchar(255) comment 'Название',
    description text comment 'Описание',
    price       decimal(11, 2) comment 'Цена',
    catalog_id  int unsigned
) comment = 'Товарные позиции';

drop table if exists orders;
create table orders
(
    id      int unsigned,
    user_id int unsigned
) comment = 'Заказы';

drop table if exists orders_products;
create table orders_products
(
    id         int unsigned,
    order_id   int unsigned,
    product_id int unsigned,
    total      int unsigned default comment 'Количество заказанных товарных позиций'
) comment= 'Состав заказа';

drop table if exists discounts;
create table discounts
(
    id         int unsigned,
    user_id    int unsigned,
    product_id int unsigned,
    discount   float unsigned comment 'Величина скидки от 0,0 до 1,0'
) comment = 'Скидки';

drop table if exists storehouses_products;
create table storehouses_products
(
    id         int unsigned,
    storehouse_id    int unsigned,
    product_id int unsigned,
    value   int unsigned comment 'Запас товарной позиции на складе'
) comment = 'Запасы на складе'