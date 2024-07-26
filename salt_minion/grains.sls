{% set state_id_prefix = "salt_minion.grains" %}
{% set id = salt['grains.get']('id') %}


{% if 'master' in id %}
{{ state_id_prefix }}_set_role_grain:
  grains.present:
    - name: role
    - value: salt_master
{% endif %}


{{ state_id_prefix }}_set_hostname_grain:
  grains.present:
    - name: hostname
    - value: {{ id }}


{% if 'dv' in id %}
{{ state_id_prefix }}_set_env_grain:
  grains.present:
    - name: env
    - value: dev
{% endif %}


{% if 'ap' in id %}
{{ state_id_prefix }}_set_type_grain:
  grains.present:
    - name: type
    - value: application server
{% endif %}


{% if 'http' in id %}
{{ state_id_prefix }}_set_app_grain:
  grains.present:
    - name: application
    - value: apache
{% endif %}


{% if 'ac' in id %}
{{ state_id_prefix }}_set_cloud_type_grain:
  grains.present:
    - name: cloud provider
    - value: AWS
{% endif %}


{{ state_id_prefix }}_reload_grains:
  module.run:
    - name: saltutil.sync_grains


{{ state_id_prefix }}_refresh_grains:
  module.run:
    - name: saltutil.refresh_grains
