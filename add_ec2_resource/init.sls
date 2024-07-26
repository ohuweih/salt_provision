{% set env = salt['grains.get']('env') %}
{% set ip_address = salt['grains.get']('ipv4')[0] %}
{% set region = 'us-east-2' %}
{% set id = salt['grains.get']('id') %}
{% set instance_id = salt['ec2_utils.get_instance_id_by_ip'](ip_address, region) %}


{% set tags = {
    'HostName': id,
    'Data_Classification': 'False',
    'Environment': env,
    'OS': 'RHEL8.9',
    'PatchGroup': 'RHEL',
    'Backup': 'True'
} %}

{% if 'http' in id %}
    {% set tags = tags.update({'Application': 'http'}) %}
{% endif %}



{% set state_id_prefix = "add_ec2_resource" %}


{{ state_id_prefix}}_sgs_to_instance:
  module.run:
    - name: ec2_utils.modify_instance_sg
    - region: {{ region }}
    - instance_id: {{ instance_id }}
    - security_group_names:
      - gaies-common-scg-id
      - gaies-{{ env }}-scg-id
      - gaies-{{ env }}-scg-id_testing_this


{{ state_id_prefix }}_tag_instance:
  module.run:
    - name: ec2_utils.tag_instance
    - region: {{ region }}
    - instance_id: {{ instance_id }}
    - tags: {{ tags | tojson }}
