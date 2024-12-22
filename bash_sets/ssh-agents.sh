# See https://web.archive.org/web/20210506080335/
# https://mah.everybody.org/docs/ssh

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519 ~/.ssh/lt_ssh/aws-lt-baryon.pem ~/.ssh/lt_ssh/aws-lt-it-prod-ec2-20240710.pem

