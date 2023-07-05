with
    source_creditcard as(
        select
            creditcardid as id_creditcard
            , cardtype
            , cardnumber
            , expmonth
            , expyear
            , modifieddate
        from {{ source('dev_alex', 'creditcard') }}
    )

select *
from source_creditcard