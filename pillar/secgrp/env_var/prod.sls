secgrps:
  - name: gaies-pe-prod-common-scg
    description: "Common secgrp for gaies pe"
    vpc: vpc-0da4036c07a04d82b
    rules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.246.123/32
        description: Bastion
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.144/28
        description: PE db subnet 1
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.64/26
        description: pe app subnet 2
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.0/24
        description: NW VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.128/28
        description: pe db subnet 1
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
        cidrIp: 10.146.75.0/26
        description: pe app subnet 2
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.0/24
        description: PE prod VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-prod-common-scg
      - ipProtocol: tcp
        fromPort: 2049
        toPort: 2049
        sourceGroupName: gaies-pe-prod-common-scg
        description: Self
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.105.6/28
        description: Salt Master
    tags: {"Name": "gaies-pe-prod-common-scg", "vpc": "vpc-0da4036c07a04d82b", "Environment": "prod", "ManagedBy": "Salt", "Project": "gaies-pe"}

  - name: gaies-pe-prod-ecs-fargate-LoadBalancerSecurityGroup
    description: "Access through LoadBalancer"
    vpc: vpc-0da4036c07a04d82b
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
        cidrIp: 10.146.75.0/24
        description: pe prod VPC
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
        sourceGroupName: gaies-pe-prod-common-scg
        description: common secgrp
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-prod-ecs-fargate-LoadBalancerSecurityGroup
        description: Self
    tags: {"Name": "gaies-pe-prod-ecs-fargate-LoadBalancerSecurityGroup", "vpc": "vpc-0da4036c07a04d82b", "Environment": "prod", "Project": "gaies-pe", "Manageby": "Salt"}

  - name: gaies-pe-prod-ecs-fargate-ContainerSecurityGroup
    description: "Access for ecs Containers"
    vpc: vpc-0da4036c07a04d82b
    egressRules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.0/24
        description: pe Prod Vpc
    rules:
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.0/24
        description: PE prod VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.68/32
        description: ''
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.64/26
        description: pe app subnet 2
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
        sourceGroupName: gaies-pe-prod-ecs-fargate-ContainerSecurityGroup
        description: Self
    tags: {"Name": "gaies-pe-prod-ecs-fargate-ContainerSecurityGroup", "vpc": "vpc-0da4036c07a04d82b", "Environment": "prod", "Project": "gaies-pe", "Manageby": "Salt"}

  - name: gaies-pe-prod-common-scg-2
    description: "Common secgrp for gaies pe"
    vpc: vpc-0da4036c07a04d82b 
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
        cidrIp: 10.146.75.0/24
        description: PE prod VPC
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.246.123/32
        description: bastion
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.146.75.64/26
        description: pe app subnet 2
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.240.52/32
        description: trusted interface
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        cidrIp: 10.189.241.0/24
        description: trusted interface
      - ipProtocol: all
        fromPort: -1
        toPort: -1
        sourceGroupName: gaies-pe-prod-common-scg-2
        description: Self
    tags: {"Name": "gaies-pe-prod-common-scg-2", "Environment": "prod", "vpc": "vpc-0da4036c07a04d82b", "Project": "gaies-pe", "Manageby": "Salt"}