targetGroups:
  - name: gaies-pe-uat-targetgroup
    port: 443
    region: us-east-1
    protocol: HTTPS
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: "vpc-0e87a15866e00bb75"
    tags:
      - {"Key":"Name", "Value": "gaies-pe-uat-targetgroupl"} 
      - {"Key": "Environment", "Value": "uat"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}

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
    tags:
      - {"Key":"Name", "Value": "gaies-pe-uat-flask-targetgroup"} 
      - {"Key": "Environment", "Value": "uat"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}