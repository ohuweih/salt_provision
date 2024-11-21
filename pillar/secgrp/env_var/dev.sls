secgrps:
  - name: gaies-pe-dev-common-scg-SALT-Finale-Test-really
    description: "Common secgrp for gaies pe"
    vpc: vpc-0ab445d0a2c633df4
    rules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.246.123/32
        description: Bastion
        name: a
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.73.0/24
        description: PE DVST VPC
        name: b
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.147.73.0/24
        name: c
        description: old dev VPC - delete after cleanup finished
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.0/24
        description: NW VPC
        name: d
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.73.96/28
        description: subnet
        name: e
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.52/32
        description: trusted interface
        name: f
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.202/32
        description: trusted interface failover
        name: h
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 167.219.0.0/16
        description: state VPN
        name: g
      - ipProtocol: tcp
        fromPort: 1521
        toPort: 1521
        cidrIp: 10.146.73.0/24
        description: PE DVST VPC
        name: i
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-dev-common-scg-SALT-Finale-Test-really
        description: self
        name: j
    tags: [{'Key': "Name", 'Value': "gaies-pe-dev-common-scg-SALT-Finale-Test-really"}, { "Key": "vpc", "Value": "vpc-0ab445d0a2c633df4"}, {"Key": "ManagedBy", "Value": "Salt"}, {"Key": "Project", "Value": "gaies-pe"}]