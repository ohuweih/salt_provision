{% set state_id_prefix = "salt_minion.basics" %}
{% set hostname = salt['grains.get']('id') %}
{% set ip = salt['grains.get']('ipv4')[0] %}


{{ state_id_prefix }}_install_boto3:
  cmd.run:
    - name: salt-pip install boto3


{{ state_id_prefix }}_install_boto:
  cmd.run:
    - name: salt-pip install boto


{{ state_id_prefix }}_set_hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ hostname }}


{{ state_id_prefix }}_set_timezone:
  cmd.run:
    - name: timedatectl set-timezone America/New_York
