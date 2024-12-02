loadBalancers:
  - loadBalancerName: "gaies-pe-sit-LoadBalancer"
    securityGroups:
      - {{ salt['grains.get']('gaies-pe-sit-LoadBalancerSecurityGroup') }}
    subnets:
      - subnet-0c9c6067d938a27cd
      - subnet-01a10c7f987c696ea
    listeners:
    port: 443
    protocol: HTTPS
    certificateArn: arn:aws:acm:us-east-1:613398752565:certificate/35f19007-262b-44f2-a074-09b9cd7f6c52
    scheme: internal
    account: 613398752565
    defaultTargetGroup: gaies-pe-dev-flask-targetgroup
    listenerTags: 
      - {"Key":"Name", "Value": "gaies-pe-dev-LR"} 
      - {"Key": "Environment", "Value": "dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}
    loadBalancerTags:
      - {"Key":"Name", "Value": "gaies-pe-dev-LB"} 
      - {"Key": "Environment", "Value": "dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}
    rules:
      - name: a
        targetGroupName: gaies-pe-dev-flask-ECS
        method:
          - POST
          - OPTIONS
        sticky: True
        priority: 210
        tags:
          - {"Key": "Name", "Value": "gaies-pe-dev-flask-rule"}
        hostHeader:
          - policydev.tools.gateway.ga.gov
      - name: b
        targetGroupName: gaies-pe-dev-NEWTargetGroup
        hostHeader:
          - policydev.tools.gateway.ga.gov
        sticky: False
        priority: 220
        tags:
          - {"Key": "Name", "Value": "gaies-pe-dev-ui-rule"}
