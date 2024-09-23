with
base as (
    select *
    from read_csv(
        's3://us-prd-motherduck-open-datasets/stocks/**/ticker_history_*.csv',
        filename = true
    )
)

select
    UNNEST(ARG_MAX(ticker_history,"filename")) 
from
    base as ticker_history
group by
    Symbol,
    Date