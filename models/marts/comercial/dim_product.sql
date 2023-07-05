with
    product as (
        select *
        from {{ ref('stg_product') }}
    )

    , transformed as (
        select 
            row_number() over (order by id_product) as sk_product
            , product.id_product
            , product.product_name
            , product.color
            , product.safetystocklevel
            , product.standardcost
            , product.listprice
            , product.product_size
            , product.product_weight
            , product.daystomanufacture
            , product.sellstartdate
            , product.sellenddate
            , product.discontinueddate
        from product
       
    )

select *
from transformed