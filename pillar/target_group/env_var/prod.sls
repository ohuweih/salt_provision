targetGroups:
  - name: gaies-pe-prod-targetgroup
    port: 443
    region: us-east-1
    protocol: HTTPS
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: "vpc-0da4036c07a04d82b"
    tags:
      - {"Key":"Name", "Value": "gaies-pe-prod-ui-targetgroup"} 
      - {"Key": "Environment", "Value": "prod"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}

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
    tags:
      - {"Key":"Name", "Value": "gaies-pe-prod-flask-targetgroup"} 
      - {"Key": "Environment", "Value": "prod"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}