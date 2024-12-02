efsValues:
  - name: gaies-pe-uat-ui
    performanceMode: generalPurpose
    encrypted: True
    backup: True
    fileSystemId:
    subnets:
      - subnetId: subnet-023848e4927027f73
        ipAddress: 10.146.74.100
        secGrps:
          - {{ salt['grains.get']('gaies-pe-uat-common-scg') }}
      - subnetId: subnet-069804bbc925145c1
        ipAddress: 10.146.74.60
        secGrps:
          - {{ salt['grains.get']('gaies-pe-uat-common-scg') }}
    tags: 
      - {"Key": "Name", "Value": "gaies-pe-uat-ui"}
      - {"Key": "Environment", "Value": "uat"} 
      - {"Key":"Project", "Value": "gaies-pe"} 
      - {"Key":"Manageby", "Value": "Salt"}