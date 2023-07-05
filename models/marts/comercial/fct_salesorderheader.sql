with 
	customer as (
    	select 
        	sk_customer
        	, id_customer
    	from {{ ref('dim_customer') }}
)

	, reason as (
    	select 
        	sk_reason
        	, id_reason
			, id_salesorder
    	from {{ ref('dim_reason') }}
)

	, address as (
    	select 
       		sk_address
        	, id_address
    	from {{ ref('dim_address') }}
)

	, creditcard as (
    	select 
        	sk_creditcard
        	, id_creditcard
    	from {{ ref('dim_creditcard') }}
)


/*Join Sales Order Header and dim_customer and dim_address and dim_reason and dim_creditcard*/
	, joining_salesorder as (
    	select
        	salesorderheader.id_salesorder
			, customer.sk_customer as fk_customer
        	, reason.sk_reason as fk_reason
        	, address.sk_address as fk_address
        	, creditcard.sk_creditcard as fk_creditcard
        	, salesorderheader.order_status
			, salesorderheader.status
        	, salesorderheader.orderdate
        	, salesorderheader.duedate
        	, salesorderheader.shipdate
        	, salesorderheader.subtotal
        	, salesorderheader.taxamt
        	, salesorderheader.freight
        	, salesorderheader.totaldue

    	from {{ ref('stg_salesorderheader') }} salesorderheader
		left join customer on salesorderheader.id_customer = customer.id_customer
    	left join reason on salesorderheader.id_salesorder = reason.id_salesorder
    	left join address on salesorderheader.id_billtoaddress = address.id_address and salesorderheader.id_shiptoaddress = address.id_address
    	left join creditcard on salesorderheader.id_creditcard = creditcard.id_creditcard
)

select *
from joining_salesorder