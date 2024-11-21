secgrps:
  - name: gaies-pe-uat-common-scg
    description: "Common secgrp for gaies pe"
    vpc: vpc-0e87a15866e00bb75
    rules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.246.123/32
        description: Bastion
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.144/28
        description: PE DVST VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.64/26
        description: old dev VPC - delete after cleanup finished
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.0/24
        description: NW VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.128/28
        description: subnet
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.52/32
        description: trusted interface
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.202/32
        description: trusted interface failover
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 167.219.0.0/16
        description: state VPN
      - ipProtocol: tcp
        fromPort: 1521
        toPort: 1521
        cidrIp: 10.146.74.0/26
        description: PE UAT VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.0/24
        description: PE DVST VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-uat-common-scg
        description: Self
    tags: {"Name": "gaies-pe-uat-common-scg", "vpc": "vpc-0ab445d0a2c633df4", "ManagedBy": "Salt", "Project": "gaies-pe"}

  - name: gaies-pe-uat-ecs-fargate-LoadBalancerSecurityGroup
    description: "Access through LoadBalancer"
    vpc: vpc-0e87a15866e00bb75 
    rules:
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 10.0.0.0/8
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 10.189.0.0/16
        description: Bastion
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 10.147.112.0/20
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 198.176.174.0/24
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 207.182.73.0/24
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 10.146.74.0/26
        description: pe-uat VPC
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 172.16.0.0/12
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 24.159.164.0/23
        description: State VPN
      - ipProtocol: tcp
        fromPort: 80
        toPort: 80
        cidrIp: 10.189.0.0/16
        description: bastion
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 192.168.0.0/16
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 72.162.0.0/16
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 10.183.9.0/25
        description: State VPN
      - ipProtocol: tcp
        fromPort: 5000
        toPort: 5000
        cidrIp: 10.146.74.0/24
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 167.200.0.0/16
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 24.248.8.0/24
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 167.192.0.0/13
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 167.219.0.0/16
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 167.193.79.200/30
        description: State VPN
      - ipProtocol: tcp
        fromPort: 443
        toPort: 443
        cidrIp: 167.196.224.0/23
        description: State VPN
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-uat-common-scg
        description: common secgrp
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-uat-ecs-fargate-LoadBalancerSecurityGroup
        description: Self
    tags: {"Name": "gaies-pe-uat-ecs-fargate-LoadBalancerSecurityGroup", "vpc": "vpc-0ab445d0a2c633df4", "Environment": "uat", "Project": "gaies-pe", "Manageby": "Salt"}

  - name: gaies-pe-uat-ecs-fargate-ContainerSecurityGroup
    description: "Access for ecs Containers"
    vpc: vpc-0e87a15866e00bb75 
    rules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.0/26
        description: PE UAT VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.68/32
        description: ''
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.64/26
        description: PE UAT VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.246.0/24
        description: stub-vpc-1
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.65.0/24
        description: stub-vpc-2
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-uat-ecs-fargate-ContainerSecurityGroup
        description: Self
    tags: {"Name": "gaies-pe-uat-ecs-fargate-ContainerSecurityGroup", "Environment": "uat", "Project": "gaies-pe", "Manageby": "Salt"}

  - name: gaies-pe-common-scg-new
    description: "Common secgrp for gaies pe"
    vpc: vpc-0e87a15866e00bb75 
    rules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 167.219.0.0/16
        description: State VPN
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.202/32
        description: trusted interface failover
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.0/26
        description: PE uat VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.246.123/32
        description: bastion
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.64/26
        description: PE uat VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.52/32
        description: trusted interface
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.0/24
        description: ''
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.74.0/24
        description: NWVPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-common-scg-new
        description: Self
    tags: {"Name": "gaies-pe-common-scg-new", "Environment": "uat", "Project": "gaies-pe", "Manageby": "Salt"}