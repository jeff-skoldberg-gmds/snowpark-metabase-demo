# Deploying Metabase Container into Snowpark Container Services

## Requirements
1. Docker. 
2. Snowflake account: an Enterprise Edition within the region of either AWS - Europe (London) or  AWS - Asia Pacific (Mumbai). [Region info](https://docs.snowflake.com/en/developer-guide/snowpark-container-services/overview#label-snowpark-containers-overview-available-regions).
3. Set default role to another that is not ACCOUNTADMIN or SYSADMIN.

## Snowflake Setup
1. In Snowflake UI, run commands from setup.sql. More info [here](https://docs.snowflake.com/en/developer-guide/snowpark-container-services/tutorials/common-setup#create-snowflake-objects).
2. Save image repository URL. It should be:
`<orgname>-<acctname>.snowflakecomputing.com/tutorial_db/data_schema/tutorial_repository`.

## Build and Push Image
1. Building from Dockerfile:
```sh
docker build --rm --platform linux/amd64 -t <repository_url>/metabase_service_image:latest .
```
2. Authenticate Docker with the Snowflake registry: 
```sh
docker build --rm --platform linux/amd64 -t <repository_url>/metabase_service_image:latest .
```
3. Push image:
```sh
docker push <repository_url>/<image_name>
```

## Create and Access Service:
1. Execute commands from `create_access_service.sql`

## Clean up
1. Execute commands from `clean_up.sql`
