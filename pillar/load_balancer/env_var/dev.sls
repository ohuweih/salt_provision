loadBalancers:
  - loadBalancerName: "gaies-pe-dev-Lb-csalt"
    securityGroups:
      - gaies-pe-dev-ecs-fargate-NEW-LoadBalancerSecurityGroup-ETzFN8FupL2t
    subnets: 
      - subnet-0c9c6067d938a27cd
      - subnet-01a10c7f987c696ea
    listeners:
    port: 80
    protocol: HTTP
    certificate: arn
    scheme: internal
    account: 613398752565
    defaultTargetGroup: gaies-pe-dev-targetgroup-salt
    listenerTags:  {"Name": "gaies-pe-dev-Lr-csalt", "Environment": "Dev", "ManagedBy": "Salt", "Project": "gaies-pe", "DeleteThis": "True" }
    loadBalancerTags: {"Name": "gaies-pe-dev-Lb-csalt", "Environment": "Dev", "ManagedBy": "Salt", "Project": "gaies-pe", "DeleteThis": "True" }
    rules:
      - name: a
        targetGroupName: gaies-pe-dev-targetgroup-salt
        method: 
          - POST
          - OPTIONS
        sticky: True
        hostHeader:
          - policyuat.tools.gateway.ga.gov'
        priority: 110
      - name: b
        targetGroupName: gaies-pe-sit-TargetGroup
        hostHeader:
          - policyuat.tools.gateway.ga.gov
        sticky: False
        priority: 120
        method:
          - ''