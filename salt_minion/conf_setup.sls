{% set state_id_prefix = "salt_minion.conf_setup" %}
{% if grains["env"] == "prod" %}
{% set env = "prod" %}
{% else %}
{% set env = "dev" %}
{% endif %}


{% for file in ["master", "log_level"] %}

{{ state_id_prefix }}_manage_salt_minion_{{ file }}:
  file.managed:
    - name: /etc/salt/minion.d/{{ file }}.conf
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - template: jinja
    - source: salt://salt_minion/files/{{ file }}.j2
    - context:
        env: salt['grains.get']('env')

{% endfor %}


{{ state_id_prefix }}_salt_minion_svc:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: /etc/salt/minion.d/*.conf

