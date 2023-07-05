with
    source_salesorderheader as(
        select
            salesorderid as id_salesorder
            , customerid as id_customer
            , salespersonid as id_salesperson
            , territoryid as id_territory
            , billtoaddressid as id_billtoaddress
            , shiptoaddressid as id_shiptoaddress
            , shipmethodid as id_shipmethod
            , creditcardid as id_creditcard
            , currencyrateid as id_currencyrate
            , cast(orderdate as datetime) as orderdate
            , cast(duedate as datetime) as duedate
            , cast(shipdate as datetime) as shipdate
            , revisionnumber
            , status
            , case
                    when status = 1 then 'In process'
                    when status = 2 then 'Approved'
                    when status = 3 then 'Backordered'
                    when status = 4 then 'Rejected'
                    when status = 5 then 'Shipped'
                    else 'Cancelled'
            end as order_status
            , onlineorderflag
            , purchaseordernumber
            , accountnumber
            , creditcardapprovalcode
            , subtotal
            , taxamt
            , freight
            , totaldue
            , comment
            , rowguid
            , modifieddate
        from {{ source('dev_alex', 'salesorderheader') }}
    )

select*
from source_salesorderheader