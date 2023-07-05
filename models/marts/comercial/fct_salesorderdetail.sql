with
	product as (
    	select 
        	sk_product
        	, id_product
    	from {{ ref('dim_product') }}
)

	, joining_salesorderdetail as (
    	select
			salesorderdetail.id_salesorder
			, salesorderdetail.id_salesorderdetail
			, salesorderdetail.id_specialoffer
			, product.sk_product as fk_product
			, salesorderdetail.carriertrackingnumber
			, salesorderdetail.orderqty
			, salesorderdetail.unitprice
			, salesorderdetail.unitpricediscount
			, salesorderdetail.unitprice * salesorderdetail.orderqty as total_gross
		from {{ ref('stg_salesorderdetail') }} salesorderdetail
		left join product on salesorderdetail.id_product = product.id_product
)

select *
from joining_salesorderdetail