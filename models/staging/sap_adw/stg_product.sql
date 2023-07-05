with
    source_product as(
        select
            productid as id_product
            , productsubcategoryid as id_productsubcategory
            , productmodelid as id_productmodel
            , name as product_name
            , productnumber
            , makeflag
            , finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , "size" as product_size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , weight as product_weight
            , daystomanufacture
            , productline
            , class
            , style
            , sellstartdate
            , sellenddate
            , discontinueddate
            , rowguid
            , modifieddate
        from {{ source('dev_alex', 'product') }}
    )

select *
from source_product