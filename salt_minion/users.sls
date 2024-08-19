{% set state_id_prefix = salt_minion.users %}

{{ state_id_prefix }}_manage_user:
  user.present:
    - name: ohuweih
    - home: /home/ohuweih
    - shell: /bin/bash
    - createhome: True
    - groups:
      - wheel
    - ssh_authorized_keys: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwFEnbAVkCsi2VIwg7DMO1HlXmCygVc5p9lvahzFNVjVRcvhFplgBm/Jl+UaHLkv6PkMnPtMCdTpL8lS0hwxU8lzpBObuKErzEQ2QWRkoKS2QWqM797BK1fAkk5Bf2/I3uKhPUZfPOR7LQQjXM9FE7cXlRrR2Dqpqkzv6V1RqzvioBoi6+vKv089Voi8oIMZeCMfD7NM8fxb4PEdVakgMFlOeXN5ym95+lTHrlub5hbGwoUFx0UEzPMEO9s84wC8KIrSi+yrcYS4UA/3TUomjgVOn3RMRXYfoF++TzjWriElJQ5Y5icnv98BwRyoEremWg05tzET7NED7b2eMIW4WdOgeZzxMN95Geb4r121t+PSGh0IOLhvhx9nOjF4pJt8aRb7k87TJMqTwFpDx9ZZwZVHCIqIMZouIoDHOJLQG4kr4eX1JH9/SG99Hp+tXDEcMxaMe7mwq5nRGLyrex5HBK+1Dlp8xeEm6+Wx1wiFJk1Lzu4l69DQb0bGRWejmAysE= ohuweih@DESKTOP-73OO1HO'
