/*Este teste de dado ira alertar quando o preço unitário for menor que zero*/

with
    unitprice_test as(
        select
            unitprice
        from {{ ref('fct_salesorder') }}
    )
    
select *
from unitprice_test
where unitprice < 0
