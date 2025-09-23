CREATE TABLE IF NOT EXISTS worldbank_gdp_per_capita (
    country_code String,
    period Date,
    value Float64
) ENGINE = MergeTree() ORDER BY (country_code, period);

CREATE TABLE IF NOT EXISTS sales_orders (
    order_id UUID,
    order_date DateTime,
    order_total Float64
) ENGINE = MergeTree() ORDER BY (order_date, order_id);
