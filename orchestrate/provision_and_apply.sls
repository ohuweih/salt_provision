provision_instance:
  salt.runner:
    - name: cloud.profile
    - prof: rhel_t2 
    - instances: xdv1aphttp01dac,xdv1aphttp02dac
    - async: True


apply_provisioning_state:
  salt.state:
    - tgt_type: list
    - tgt: 
      - xdv1aphttp01dac 
      - xdv1aphttp02dac
    - sls:
      - salt_minion.provisioning_init
    - require:
      - salt: provision_instance


apply_highstate:
  salt.state:
    - tgt_type: list
    - tgt:
      - xdv1aphttp01dac
      - xdv1aphttp02dac
    - highstate: True
    - require:
      - salt: apply_provisioning_state


apply_highstate_2:
  salt.state:
    - tgt_type: list
    - tgt:
      - xdv1aphttp01dac
      - xdv1aphttp02dac
    - highstate: True
