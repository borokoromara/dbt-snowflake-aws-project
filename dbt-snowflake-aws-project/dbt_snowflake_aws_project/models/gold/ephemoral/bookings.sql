{{ config(
    materialized='ephemeral'
) }}

WITH bookings AS (
    SELECT
        BOOKING_ID,
        LISTING_ID,
        BOOKING_DATE,
        TOTAL_AMOUNT,
        SERVICE_FEE,
        CLEANING_FEE,
        BOOKING_STATUS,
        CREATED_AT
    FROM {{ ref('silver_bookings') }}
)

SELECT *
FROM bookings