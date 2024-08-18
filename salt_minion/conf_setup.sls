{% set state_id_prefix = "salt_minion.conf_setup" %}
{% if grains["env"] == "prod" %}
{% set env = "prod" %}
{% else %}
{% set env = "dev" %}
{% endif %}


{{ state_id_prefix }}_salt_minion_svc:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: /etc/salt/minion.d/*.conf

