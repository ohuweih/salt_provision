{% set state_id_prefix = 'salt_minion.users' %}

{{ state_id_prefix }}_manage_user:
  user.present:
    - name: ohuweih
    - home: /home/ohuweih
    - shell: /bin/bash
    - createhome: True
    - groups:
      - wheel

{{ state_id_prefix }}_manage__user_keys:
  file.managed:
    - name: /home/ohuweih/.ssh/authorized_keys
    - source: salt://salt_minion/files/ohuweih_id_rsa.pub
    - user: ohuweih
    - mode: 0600
    - makedirs: True
