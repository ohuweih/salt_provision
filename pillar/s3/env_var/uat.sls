s3Buckets:
  - name: gaies-pe-uat
    tags: {"Name": "gaies-pe-uat", "ManagedBy": "Salt", "Project": "gaies-pe", "Environment": "uat"}
    versioning: Enabled
    loggingBucket: gaies-pe-uat-s3-access-logs
    account: 324053739222
    functionName: gaies-pe-uat-backend-container