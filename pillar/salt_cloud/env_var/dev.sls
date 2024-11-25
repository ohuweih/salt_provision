weaviate:
  ami: ami-050e3219eb243dd57
  keyName: gaies-pe-{{ salt['grains.get']('env') }}
  privateKeyLocation: /srv/secrets/gaies-pe-dev.pem
  iamProfile: gaies-dev-pe-ec2-instanceprofile-role
  hostName: xat1pewvacgw02e
  subnetId: subnet-0c9c6067d938a27cd