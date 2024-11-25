loadBalancers:
  - loadBalancerName: "gaies-pe-uat-LoadBalancer"
    securityGroups:
      - {{ salt['grains.get']('gaies-pe-uat-ecs-fargate-LoadBalancerSecurityGroup') }}
    subnets:
      - subnet-069804bbc925145c1
      - subnet-023848e4927027f73
    listeners:
    port: 443
    protocol: HTTPS
    certificateArn: arn:aws:acm:us-east-1:324053739222:certificate/c3c9d343-1e54-46cd-895d-bf9b60eda91c
    scheme: internal
    account: 324053739222
    defaultTargetGroup: gaies-pe-uat-flask-targetgroup
    listenerTags: 
      - {"Key":"Name", "Value": "gaies-pe-uat-LR"} 
      - {"Key": "Environment", "Value": "uat"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}
    loadBalancerTags:
      - {"Key":"Name", "Value": "gaies-pe-uat-LB"} 
      - {"Key": "Environment", "Value": "uat"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}
    rules:
      - name: a
        targetGroupName: gaies-pe-uat-flask-targetgroup
        method:
          - POST
          - OPTIONS
        sticky: True
        priority: 100
        tags:
          - {"Key": "Name", "Value": "gaies-pe-uat-flask-rule"}
        hostHeader:
          - policyuat.tools.gateway.ga.gov
      - name: b
        targetGroupName: gaies-pe-uat-targetgroup
        hostHeader:
          - policyuat.tools.gateway.ga.gov
        sticky: False
        priority: 110
        tags:
          - {"Key": "Name", "Value": "gaies-pe-uat-ui-rule"}
