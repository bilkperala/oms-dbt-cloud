--use warehouse stripe;
select 
id,
orderid,
paymentmethod,
status,
amount
from {{ source('stripe', 'payment') }}