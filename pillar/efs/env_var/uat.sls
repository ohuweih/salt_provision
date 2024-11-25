efsValues:
  - name: gaies-pe-uat-efs
    performanceMode: generalPurpose
    encrypted: True
    backup: True
    fileSystemId:
    subnetId: subnet-069804bbc925145c1
    ipAddress: 10.146.74.60
    secGrps:
      - {{ salt['grains.get']('gaies-pe-uat-common-scg') }}
    tags: 
      - {"Key": "Name", "Value": "gaies-pe-uat"}
      - {"Key": "Environment", "Value": "uat"} 
      - {"Key":"Project", "Value": "gaies-pe"} 
      - {"Key":"Manageby", "Value": "Salt"}