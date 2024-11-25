targetGroups:
  - name: gaies-pe-gitlab-pl
    port: 80
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: vpc-0ab445d0a2c633df4
    tags:
      - {"Key":"Name", "Value": "gaies-pe-gitlab-pl"} 
      - {"Key": "Environment", "Value": "Dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Deletethis", "Value": "True"}
      - {"Key": "Project", "Value": "gaies-pe"}

  - name: gaies-pe-flask-gitlab-pl
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
      - {"Key":"Name", "Value": "gaies-pe-flask-gitlab-pl"} 
      - {"Key": "Environment", "Value": "Dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Deletethis", "Value": "True"}
      - {"Key": "Project", "Value": "gaies-pe"}