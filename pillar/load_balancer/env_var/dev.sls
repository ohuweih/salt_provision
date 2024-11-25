loadBalancers:
  - loadBalancerName: "gaies-pe-grains-test-LB-4"
    securityGroups:
      - {{ salt['grains.get']('gaies-pe-dev-pipeline-test-5') }}
    subnets: 
      - subnet-0c9c6067d938a27cd
      - subnet-01a10c7f987c696ea
    listeners:
    port: 443
    protocol: HTTPS
    certificateArn: arn:aws:acm:us-east-1:613398752565:certificate/35f19007-262b-44f2-a074-09b9cd7f6c52
    scheme: internal
    account: 613398752565
    defaultTargetGroup: gaies-pe-dev-grains-set-test
    listenerTags: 
      - {"Key":"Name", "Value": "gaies-pe-dev-grains-set-test-Lr-4"} 
      - {"Key": "Environment", "Value": "Dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Deletethis", "Value": "True"}
      - {"Key": "Project", "Value": "gaies-pe"}
    loadBalancerTags:
      - {"Key":"Name", "Value": "gaies-pe-dev-grains-set-test-LB-4"} 
      - {"Key": "Environment", "Value": "Dev"}
      - {"Key": "Manageby", "Value": "Salt"} 
      - {"Key": "Deletethis", "Value": "True"}
      - {"Key": "Project", "Value": "gaies-pe"}
    rules:
      - name: a
        targetGroupName: gaies-pe-dev-grains-set-test
        method: 
          - POST
          - OPTIONS
        sticky: True
        hostHeader:
          - policyuat.tools.gateway.ga.gov'
        priority: 110
        tags:
          - {"Key": "Name", "Value": "gaies-pe-prd-flask-rule"}
      - name: b
        targetGroupName: gaies-pe-dev-grains-set-test
        hostHeader:
          - policyuat.tools.gateway.ga.gov
        sticky: False
        priority: 120
        tags:
          - {"Key": "Name","Value": "gaies-pe-prd-ui-rule"}
        method:
          - ''