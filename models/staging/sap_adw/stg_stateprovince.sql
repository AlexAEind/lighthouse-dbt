with
    source_stateprovince as(
        select
            stateprovinceid as id_stateprovince
            , territoryid as id_territory
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name as stateprovince_name
            , rowguid
            , modifieddate
        from {{ source('dev_alex', 'stateprovince') }}
    )

select *
from source_stateprovince