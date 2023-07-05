with
    source_salesorderdetail as(
        select
            salesorderid as id_salesorder
            , salesorderdetailid as id_salesorderdetail
            , productid as id_product
            , specialofferid as id_specialoffer
            , carriertrackingnumber
            , orderqty
            , unitprice
            , unitpricediscount
            , rowguid
            , modifieddate
        from {{ source('dev_alex', 'salesorderdetail') }}
    )

select *
from source_salesorderdetail