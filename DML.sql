1// 

SELECT customer_name
FROM customer
WHERE customer_name like 'Ma%'; 

-----------------------------------
2//

SELECT ord.order_id, ord.quantity as count, ord.quantity * it.unit_price as total_price
FROM order_item ord natural join item it
order by ord.order_id;

-----------------------------------
3//

SELECT ship.order_id, war.warehouse_city
FROM shipment ship natural join warehouse war
where war.warehouse_city = "Arica";

-----------------------------------
4//

SELECT sum(ord.quantity * it.unit_price)as total_price_of_orders
FROM shipment ship natural join (order_item ord natural join item it)
WHERE  ship.warehouse_id=8;

-----------------------------------
5//

SELECT war.warehouse_id,war.warehouse_city, COUNT(ship.order_id) as amount_of_orders_shipped
FROM warehouse war left outer join shipment ship ON (war.warehouse_id=ship.warehouse_id)
GROUP BY war.warehouse_id;

-----------------------------------
6//

SELECT cus.customer_name, COUNT(ord.order_id) as count_of_orders
FROM customer cus LEFT OUTER JOIN `order` ord ON (cus.customer_id=ord.customer_id)
GROUP BY cus.customer_id;

-----------------------------------
7//

(SELECT it.item_id
FROM item it left outer join order_item ord ON (it.item_id=ord.item_id))

EXCEPT

(SELECT it.item_id
FROM item it NATURAL join order_item ord);

----------------------------------- 



