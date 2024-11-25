s3Buckets:
  - name: gaies-pe-uat
    tags: {"Name": "gaies-pe-uat", "ManagedBy": "Salt", "Project": "gaies-pe", "Environment": "uat"}
    versioning: Enabled
    loggingBucket: gaies-pe-uat-s3-access-logs
    functionName: gaies-pe-uat-backend-container
    roleArn: {{ salt['grains.get']('gaies-pe-uat-backend-container') }}