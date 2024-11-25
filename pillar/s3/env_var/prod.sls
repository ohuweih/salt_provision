s3Buckets:
  - name: gaies-pe-prod
    tags: {"Name": "gaies-pe-prod", "ManagedBy": "Salt", "Project": "gaies-pe", "Environment": "prod"}
    versioning: Enabled
    loggingBucket: gaies-pe-prod-s3-access-logs
    functionName: gaies-pe-prod-backend-container
    roleArn: {{ salt['grains.get']('gaies-pe-prod-backend-container') }}