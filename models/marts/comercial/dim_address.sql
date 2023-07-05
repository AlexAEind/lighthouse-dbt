with
    address as (
        select *
        from {{ ref('stg_address') }}
    )

    , countryregion as (
        select *
        from {{ ref('stg_countryregion') }}
    )

    , stateprovince as (
        select *
        from {{ ref('stg_stateprovince') }}
    )


    , transformed as (
        select 
            row_number() over (order by id_address) as sk_address
            , address.id_address
            , address.addressline1
            , address.postalcode
            , address.city
            , stateprovince.id_stateprovince
            , stateprovince.stateprovince_name
            , countryregion.country_name
        from stateprovince
        left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode
        left join address on stateprovince.id_stateprovince = address.id_stateprovince
    )

select *
from transformed
