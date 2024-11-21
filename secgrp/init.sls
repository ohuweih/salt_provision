{% set state_id_prefix = "secgrp" %}

{% if pillar['secgrps'] is defined %}
{% set secgrps = pillar['secgrps'] %}
{% for secgrp in secgrps %}

{{ state_id_prefix }}_set_secgrp_{{ secgrp.name }}:
  boto_secgroup.present:
    - name: {{ secgrp.name }}
    - description: {{ secgrp.description }}
    - vpc_id: {{ secgrp.vpc }}
    - rules:
      {% for rule in secgrp.rules %}
      {% if rule.cidrIp is defined %}
      - ip_protocol: {{ rule.ipProtocol }}
        from_port: {{ rule.fromPort }}
        to_port: {{ rule.toPort}}
        cidr_ip: {{ rule.cidrIp }}
        description: {{ rule.description}}
      {% endif %}
      {% endfor %}
    - tags: {{ secgrp.tags | tojson }}
    - region: us-east-1

{{ state_id_prefix }}_set_secgrp_take2_{{ secgrp.name }}:
  boto_secgroup.present:
    - name: {{ secgrp.name }}
    - description: {{ secgrp.description }}
    - vpc_id: {{ secgrp.vpc }}
    - rules:
      {% for rule in secgrp.rules %}
      {% if rule.sourceGroupName is defined %}
      - ip_protocol: {{ rule.ipProtocol }}
        from_port: {{ rule.fromPort }}
        to_port: {{ rule.toPort}}
        source_group_name: {{ rule.sourceGroupName }}
        description: {{ rule.description}}
      {% endif %}
      {% endfor %}
    - tags: {{ secgrp.tags | tojson }}
    - region: us-east-1
{% endfor %}
{% endif %}
