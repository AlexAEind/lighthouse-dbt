with
    source_countryregion as(
        select
            countryregioncode
            , name as country_name
            , modifieddate
        from {{ source('dev_alex', 'countryregion') }}
    )

select *
from source_countryregion