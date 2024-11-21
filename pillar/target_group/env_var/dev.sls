targetGroups:
  - name: gaies-pe-dev-sFinale-Test
    port: 80
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /policy-engine.css
    vpc: "vpc-0ab445d0a2c633df4"
    tags: {"Name": "gaies-pe-dev-ecs-ui-Salt-Test_targetGroup", "Environment": "Dev", "Manageby": "Salt", "Deletethis": "True", "Project": "gaies-pe" }

  - name: gaies-pe-dev-flask-Finale-Test
    port: 5000
    region: us-east-1
    protocol: HTTP
    unhealthyThresholdCount: 2
    healthyThresholdCount: 2
    timeout: 5
    interval: 10 
    healthCheckPath: /health
    vpc: "vpc-0ab445d0a2c633df4"
    tags: {"Name": "gaies-pe-dev-flask-targetgroup-salt", "Environment": "Dev", "Manageby": "Salt", "Deletethis": "True", "Project": "gaies-pe" }