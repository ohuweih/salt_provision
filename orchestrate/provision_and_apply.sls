provision_instance:
  salt.runner:
    - name: cloud.profile
    - prof: rhel_t2 
    - instances: testing_apache
    - async: True


apply_provisioning_state:
  salt.state:
    - tgt_type: list
    - tgt: 
      - testing_apache
    - sls:
      - salt_minion.basics
    - require:
      - salt: provision_instance


apply_highstate:
  salt.state:
    - tgt_type: list
    - tgt:
      - testing_apache
    - highstate: True
    - require:
      - salt: apply_provisioning_state


apply_highstate_2:
  salt.state:
    - tgt_type: list
    - tgt:
      - testing_apache
    - highstate: True
