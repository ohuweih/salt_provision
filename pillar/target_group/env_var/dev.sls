targetGroups:
  - name: gaies-pe-dev-NEWTargetGroup
    port: 443
    region: us-east-1
    protocol: HTTPS
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: vpc-0ab445d0a2c633df4
    tags:
      - {"Key":"Name", "Value": "gaies-pe-dev-NEWTargetGroup"} 
      - {"Key": "Environment", "Value": "dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}

  - name: gaies-pe-dev-flask-targetgroup
    port: 5000
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /health
    vpc: vpc-0ab445d0a2c633df4
    tags:
      - {"Key":"Name", "Value": "gaies-pe-dev-flask-targetgroup"} 
      - {"Key": "Environment", "Value": "dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}