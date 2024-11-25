efsValues:
  - name: gaies-pe-dev-salt-Finale-Test
    performanceMode: generalPurpose
    encrypted: False
    backup: False
    fileSystemId:
    subnetId: subnet-01a10c7f987c696ea
    ipAddress: a ip from the subnet picked. 
    secGrps:
      - {{ salt['grains.get']('gaies-pe-dev-pipeline-test-5') }}
    tags: {"Name": "gaies-pe-dev-salt-test", "vpc": "vpc-0ab445d0a2c633df4", "Environment": "Dev", "Project": "gaies-pe", "Manageby": "Salt"}