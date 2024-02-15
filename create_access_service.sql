USE ROLE test_role;
USE DATABASE tutorial_db;
USE SCHEMA data_schema;
USE WAREHOUSE tutorial_warehouse;

DESCRIBE COMPUTE POOL tutorial_compute_pool; -- STATE MUST BE "ACTIVE" OR "IDLE"

DROP SERVICE IF EXISTS metabase_service;
CREATE SERVICE metabase_service
  IN COMPUTE POOL tutorial_compute_pool
  FROM SPECIFICATION $$
    spec:
      containers:
      - name: echo
        image: /tutorial_db/data_schema/tutorial_repository/metabase_service_image:latest
      endpoints:
      - name: echoendpoint
        port: 3000
        public: true
      $$
   MIN_INSTANCES=1
   MAX_INSTANCES=1;


SHOW SERVICES; -- List services in your account
DESCRIBE SERVICE metabase_service;

-- Get info:
SELECT SYSTEM$GET_SERVICE_STATUS('metabase_service'); 
SELECT SYSTEM$GET_SERVICE_LOGS('metabase_service', 0, 'echo');
SELECT SYSTEM$GET_SERVICE_LOGS('metabase_service', 0, 'echo', 10); -- Get last ten, modify accordingly. 

-- Get link to access:
SHOW ENDPOINTS IN SERVICE metabase_service;