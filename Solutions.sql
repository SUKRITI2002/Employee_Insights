/*1st Question
Write a query to retrieve the names of all salespeople that have an order with Samsonic. 
*/
SELECT
    salesperson.first_name || ' ' || salesperson.last_name AS name_of_customers_samsonic
FROM
    customer
JOIN
    orders ON customer.customer_id = orders.customer_id
JOIN
    salesperson ON orders.sales_person_id = salesperson.sales_person_id
WHERE
    customer.customer_name = 'Samsonic';

    
/*2nd Question
Write a query to retrieve the names of all salespeople that do not have any order.*/
SELECT
    first_name || ' ' || last_name AS name_with_0_order
FROM
    salesperson
WHERE
    salesperson.sales_person_id NOT IN (
        SELECT
            sales_person_id
        FROM
            orders
    );
 
/*3rd Question
Write a query to retrieve the names of salespeople that have 2 or more orders.*/
SELECT
    first_name || ' ' || last_name AS name_2_or_more
FROM
    salesperson
WHERE
    sales_person_id IN (
        SELECT
            sales_person_id
        FROM
            orders
        GROUP BY
            sales_person_id
        HAVING
            COUNT(sales_person_id) >= 2
    );

/*4th Question
Write a query to fetch the number and total amount of orders to be delivered to each city.*/
SELECT
    customer.city,
    COUNT(*) AS order_count,
    SUM(orders.amount) AS total_amount
FROM
    customer
JOIN
    orders ON orders.customer_id = customer.customer_id
GROUP BY
    customer.city;


/*5th Question
Write a query to count the number of customers linked to each salesperson. */
SELECT
    salesperson.sales_person_id,
    COUNT(orders.customer_id) AS customer_count
FROM
    salesperson
LEFT JOIN
    orders ON salesperson.sales_person_id = orders.sales_person_id
GROUP BY
    salesperson.sales_person_id
ORDER BY
    salesperson.sales_person_id;
