{% set state_id_prefix = "salt_cloud" %}

{{ state_id_prefix }}_manage_cloud_profile
  file.managed:
    - name: /etc/salt/cloud.profiles.d/ec2_profiles.conf
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - template: jinja
    - source: salt://salt-cloud/ec2_profile.conf

{{ state_id_prefix }}_manage_cloud_provider
  file.managed:
    - name: /etc/salt/cloud.providers.d/ec2_provider.conf
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - template: jinja
    - source: salt://salt-cloud/ec2_providers.conf
