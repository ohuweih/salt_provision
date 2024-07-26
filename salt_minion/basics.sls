{% set state_id_prefix = "salt_minion.basics" %}
{% set hostname = salt['grains.get']('id') %}
{% set ip = salt['grains.get']('ipv4')[0] %}


{{ state_id_prefix }}_install_boto3:
  cmd.run:
    - name: salt-pip install boto3


{{ state_id_prefix }}_install_boto:
  cmd.run:
    - name: salt-pip install boto


{{ state_id_prefix }}_leave_flush_ad:
  cmd.run:
    - names: 
      - adleave -f
      - adflush --force

{{ state_id_prefix }}_set_hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ hostname }}


{{ state_id_prefix }}_update_core_files:
  cmd.run:
    - names:
      - sed -i "$ a HOSTNAME={{ hostname }}.ga-ies-cloud.local" /etc/sysconfig/network
      - sed -i 's/PasswordAuthentication no/#PasswordAuthentication no/g' /etc/ssh/sshd_config
      - sed -i "$ a PasswordAuthentication yes" /etc/ssh/sshd_config
      - sed -i "$ a {{ ip }} {{ hostname }}.ga-ies-cloud.local {{ hostname }}" /etc/hosts


{{ state_id_prefix }}_set_timezone:
  cmd.run:
    - name: timedatectl set-timezone America/New_York
