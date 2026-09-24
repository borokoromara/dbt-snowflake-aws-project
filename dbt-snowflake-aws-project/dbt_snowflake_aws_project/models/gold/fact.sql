{% set configs = [
    {
        "table": "AIRBNBPROJECT.GOLD.DIM_BOOKINGS",
        "columns": "BOOKINGS.BOOKING_ID,
                    BOOKINGS.LISTING_ID,
                    LISTINGS.HOST_ID,
                    BOOKINGS.TOTAL_AMOUNT,
                    BOOKINGS.SERVICE_FEE,
                    BOOKINGS.CLEANING_FEE,
                    LISTINGS.ACCOMMODATES,
                    LISTINGS.BEDROOMS,
                    LISTINGS.BATHROOMS,
                    LISTINGS.PRICE_PER_NIGHT,
                    HOSTS.RESPONSE_RATE",
        "alias": "BOOKINGS"
    },
    {
        "table": "AIRBNBPROJECT.GOLD.DIM_LISTINGS",
        "columns": "",
        "alias": "LISTINGS",
        "join_condition": "BOOKINGS.LISTING_ID = LISTINGS.LISTING_ID"
    },
    {
        "table": "AIRBNBPROJECT.GOLD.DIM_HOSTS",
        "columns": "",
        "alias": "HOSTS",
        "join_condition": "LISTINGS.HOST_ID = HOSTS.HOST_ID"
    }
] %}

SELECT
    {{ configs[0]['columns'] }}

FROM
    {% for item in configs %}
        {% if loop.first %}
            {{ item['table'] }} AS {{ item['alias'] }}
        {% else %}
            LEFT JOIN {{ item['table'] }} AS {{ item['alias'] }}
            ON {{ item['join_condition'] }}
        {% endif %}
    {% endfor %}