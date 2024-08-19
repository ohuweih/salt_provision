{% set state_id_prefix = "salt_minion.conf_setup" %}

{{ state_id_prefix }}_salt_minion_svc:
  service.running:
    - name: salt-minion
    - enable: True

