with
    salesorderheadersalesreason as (
        select *
        from {{ ref('stg_salesorderheadersalesreason') }}
    )


    , salesreason as (
        select *
        from {{ ref('stg_salesreason') }}
    )

    , transformed as (
        select 
            row_number() over (order by salesreason.id_salesreason) as sk_reason
            , salesreason.id_salesreason as id_reason
            , salesorderheadersalesreason.id_salesorder
            , salesreason.salereason
            , salesreason.reasontype
            , salesreason.id_salesreason
        from salesorderheadersalesreason
        left join salesreason on salesorderheadersalesreason.id_salesreason = salesreason.id_salesreason
    )

select *
from transformed