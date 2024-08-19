{% set state_id_prefix = "salt_minion.grains" %}
{% set id = salt['grains.get']('id') %}


{{ state_id_prefix }}_set_role_grain:
{% if 'master' in id %}
  grains.present:
    - name: role
    - value: salt_master
{% elif 'apache' in id %}
  grains.present:
    - name: role
    - value: apache
{% endif %}


{{ state_id_prefix }}_set_hostname_grain:
  grains.present:
    - name: hostname
    - value: {{ id }}


{{ state_id_prefix }}_refresh_grains:
  module.run:
    - name: saltutil.refresh_grains
