# Use Metabase as base image
FROM metabase/metabase:latest

# Expose the Metabase port
EXPOSE 3000

# Start Metabase and keep it running
CMD ["/bin/bash", "-c", "/app/run_metabase.sh && tail -f /dev/null"]

