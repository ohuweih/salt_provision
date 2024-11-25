{% set state_id_prefix = "efs" %}

{% if pillar['efsValues'] is defined %}
{% set efsValues = pillar['efsValues'] %}
{% for efsValue in efsValues %} 



{{state_id_prefix}}_create_{{ efsValue.name }}:
  module.run:
    - name: efs_utils.create_efs
    - creationToken: {{ efsValue.name }} 
    - performanceMode: {{ efsValue.performanceMode }}
    - encrypted: {{ efsValue.encrypted }} 
    - subnetId: {{ efsValue.subnetId }}
    - ipAddress: {{efsValue.ipAddress }}
    - securityGroups: {{ efsValue.secGrps }}
    - backup: {{ efsValue.backup }}
    - tags: {{ efsValue.tags }}


{% endfor %}
{% endif %}