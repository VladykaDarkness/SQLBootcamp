UPDATE menu SET
    price =
        (SELECT ROUND(0.9 * price) FROM menu WHERE pizza_name = 'greek pizza')
WHERE pizza_name = 'greek pizza';