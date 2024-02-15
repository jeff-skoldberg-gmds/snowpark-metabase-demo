-- Stop all services and jobs on the compute pool
ALTER COMPUTE POOL tutorial_compute_pool STOP ALL;

DROP COMPUTE POOL tutorial_compute_pool;

-- Clean up the image registry (remove all images) and the internal stage (remove specifications)
DROP IMAGE REPOSITORY tutorial_repository;
DROP STAGE tutorial_stage;