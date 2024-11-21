weaviate:
  ami: ami-050e3219eb243dd57
  keyName: gaies-pe-{{ salt['grains.get']('env') }}-app
  privateKeyLocation: /srv/secrets/gaies-pe-dev.pem
  iamProfile: gaies-prod-pe-ec2-instanceprofile-role
  hostName: xat1pewvacgw01e
