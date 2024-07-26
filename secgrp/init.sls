{% set state_id_prefix = "secgrp" %}
{% set env = salt['grains.get']('env') %}

{{ state_id_prefix }}_set_common_secgrp:
  boto_secgroup.present:
    - keyid: 
    - key: 
    - name: gaies-common-scg
    - region: us-east-2
    - description: Trusted SSH Access
    - vpc_name: lucid-vpc
    - rules:
      - ip_protocol: all
        from_port: 0
        to_port: 65535
        cidr_ip:
          - 10.0.0.0/24
          - 172.0.0.0/16
          - 73.50.196.7/32
          - 24.206.84.58/32
          - 3.16.146.0/29
    - tags:
        Name: gaies-common-scg


{{ state_id_prefix }}_set_{{ env }}_secgrp:
  boto_secgroup.present:
    - keyid: 
    - key: 
    - name: gaies-{{ env }}-scg-id
    - region: us-east-2
    - description: Trusted SSH Access
    - vpc_name: lucid-vpc
    - rules:
      - ip_protocol: tcp
        from_port: 22
        to_port: 22
        cidr_ip:
          - 10.0.0.0/32
          - 172.0.0.0/32
    - tags:
        Name: gaies-{{ env }}-scg-id


{{ state_id_prefix }}_set_{{ env }}__Test_secgrp:
  boto_secgroup.present:
    - keyid: 
    - key: 
    - name: gaies-{{ env }}-scg-id_testing_this
    - region: us-east-2
    - description: Trusted SSH Access
    - vpc_name: lucid-vpc
    - rules:
      - ip_protocol: tcp
        from_port: 22
        to_port: 22
        cidr_ip:
          - 10.0.0.0/32
          - 172.0.0.0/32
    - tags:
        Name: gaies-{{ env }}-scg-id
