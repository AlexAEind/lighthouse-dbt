with
    person as (
        select *
        from {{ ref('stg_person') }}
    )
    
    , customer as (
        select *
        from {{ ref('stg_customer') }}
    )


    , joined as (
        select 
            row_number() over (order by id_customer) as sk_customer
            , customer.id_customer
            , person.firstname
            , person.middlename
            , person.lastname
        from customer
        left join person on customer.id_person = person.id_businessantity
    )

    , transformed as (
        select
            sk_customer
            , id_customer
            , firstname
            , lastname
            , concat(firstname,' ', lastname) as full_name
        from joined
    )

select *
from transformed
