loadBalancers:
  - loadBalancerName: "gaies-pe-prod-LoadBalancer"
    securityGroups:
      - {{ salt['grains.get']('gaies-pe-prod-ecs-fargate-LoadBalancerSecurityGroup') }}
    subnets:
      - subnet-04300f88d58e0f7de
      - subnet-0a3f7d83e051e9605
    listeners:
    port: 443
    protocol: HTTPS
    certificateArn: arn:aws:acm:us-east-1:845537639440:certificate/659364a8-ec6e-4349-8e54-2dd4d3216f1a
    scheme: internal
    account: 845537639440
    defaultTargetGroup: gaies-pe-prod-flask-targetgroup
    listenerTags: 
      - {"Key":"Name", "Value": "gaies-pe-prod-LR"} 
      - {"Key": "Environment", "Value": "prod"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}
    loadBalancerTags:
      - {"Key":"Name", "Value": "gaies-pe-prod-LB"} 
      - {"Key": "Environment", "Value": "prod"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Project", "Value": "gaies-pe"}
    rules:
      - name: a
        targetGroupName: gaies-pe-prod-flask-targetgroup
        method:
          - POST
          - OPTIONS
        sticky: True
        priority: 100
        tags:
          - {"Key": "Name", "Value": "gaies-pe-prod-flask-rule"}
        hostHeader:
          - policyprod.tools.gateway.ga.gov
      - name: b
        targetGroupName: gaies-pe-prod-targetgroup
        hostHeader:
          - policyprod.tools.gateway.ga.gov
        sticky: False
        priority: 110
        tags:
          - {"Key": "Name", "Value": "gaies-pe-prod-ui-rule"}
