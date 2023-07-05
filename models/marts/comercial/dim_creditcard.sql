with
    creditcard as (
        select *
        from {{ ref('stg_creditcard') }}
    )

    , transformed as (
        select 
            row_number() over (order by id_creditcard) as sk_creditcard
            , creditcard.id_creditcard
            , creditcard.cardtype
        from creditcard
    )

select *
from transformed
