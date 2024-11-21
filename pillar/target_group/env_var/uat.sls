targetGroups:
  - name: gaies-pe-uat-targetgroup
    port: 80
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: "vpc-0e87a15866e00bb75"
    tags: {"Name": gaies-pe-uat-targetgroup", "Environment": "uat", "Manageby": "Salt", "Project": "gaies-pe" }

  - name: gaies-pe-uat-flask-targetgroup
    port: 5000
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /health
    vpc: "vpc-0e87a15866e00bb75"
    tags: {"Name": "gaies-pe-uat-flask-targetgroup", "Environment": "uat", "Manageby": "Salt", "Project": "gaies-pe" }