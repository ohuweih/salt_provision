loadBalancers:
  - loadBalancerName: "gaies-pe-prd-LoadBalancer"
    securityGroups:
      - gaies-pe-prd-ecs-fargate-LoadBalancerSecurityGroup
    subnets:
      - subnet-0a3f7d83e051e9605
      - subnet-04300f88d58e0f7de
    listeners:
    port: 443
    protocol: HTTPS
    certificateArn: arn:aws:acm:us-east-1:845537639440:certificate/659364a8-ec6e-4349-8e54-2dd4d3216f1a
    scheme: internal
    account: 845537639440
    defaultTargetGroup: gaies-pe-prd-flask-targetgroup/###
    listenerTags:  {"Name": "gaies-pe-prd-LoadBalancer", "Environment": "prd", "ManagedBy": "Salt", "Project": "gaies-pe"}
    loadBalancerTags: {"Name": "gaies-pe-prd-Listener", "Environment": "prd", "ManagedBy": "Salt", "Project": "gaies-pe"}
    rules:
      - name: a
        targetGroupName: gaies-pe-prd-flask-targetgroup/###
        method:
          - POST
          - OPTIONS
        sticky: True
        priority: 100
        tags:
          - {'Key:' 'Name','Value': 'gaies-pe-prd-flask-rule'}
        hostHeader:
          - policyprd.tools.gateway.ga.gov
      - name: b
        targetGroupName: gaies-pe-prd-targetgroup/####
        tags:
          - {'Key:' 'Name','Value': 'gaies-pe-prd-rule'}
        hostHeader:
          - policyprd.tools.gateway.ga.gov
        sticky: False
        priority: 110