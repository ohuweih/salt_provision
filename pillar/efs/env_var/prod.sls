efsValues:
  - name: gaies-pe-prod
    performanceMode: generalPurpose
    encrypted: True
    backup: True
    fileSystemId:
    subnets:
      - subnetId: subnet-04300f88d58e0f7de
        ipAddress: 10.146.75.60
        secGrps:
          - {{ salt['grains.get']('gaies-pe-prod-common-scg') }}
      - subnetId: subnet-0a3f7d83e051e9605
        ipAddress: 10.146.75.100
        secGrps:
          - {{ salt['grains.get']('gaies-pe-prod-common-scg') }}
    tags:
      - {"Key": "Name", "Value": "gaies-pe-prod"}
      - {"Key": "Environment", "Value": "prod"} 
      - {"Key":"Project", "Value": "gaies-pe"} 
      - {"Key":"Manageby", "Value": "Salt"}