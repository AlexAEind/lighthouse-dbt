with
    source_salesorderheadersalesreason as(
        select
            salesorderid as id_salesorder
            , salesreasonid as id_salesreason
            , modifieddate
        from {{ source('dev_alex', 'salesorderheadersalesreason') }}
    )

select *
from source_salesorderheadersalesreason