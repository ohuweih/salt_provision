targetGroups:
  - name: gaies-pe-prod-targetgroup
    port: 443
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: "vpc-0da4036c07a04d82b"
    tags: {"Name": gaies-pe-prod-targetgroup", "Environment": "prod", "Manageby": "Salt", "Project": "gaies-pe" }

  - name: gaies-pe-prod-flask-targetgroup
    port: 5000
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /health
    vpc: "vpc-0da4036c07a04d82b"
    tags: {"Name": "gaies-pe-prod-flask-targetgroup", "Environment": "prod", "Manageby": "Salt", "Project": "gaies-pe" }