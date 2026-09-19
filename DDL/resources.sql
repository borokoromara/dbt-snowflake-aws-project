CREATE OR REPLACE FILE FORMAT airbnb_csv_format
    TYPE = CSV
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    EMPTY_FIELD_AS_NULL = TRUE;


COPY INTO BOOKINGS
FROM @my_s3_stage
FILES = ('bookings.csv')
FILE_FORMAT = airbnb_csv_format;

COPY INTO HOSTS
FROM @my_s3_stage
FILES = ('hosts.csv')
FILE_FORMAT = airbnb_csv_format;

COPY INTO LISTINGS
FROM @my_s3_stage
FILES = ('listings.csv')
FILE_FORMAT = airbnb_csv_format;
