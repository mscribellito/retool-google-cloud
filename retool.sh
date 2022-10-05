# Retool install
# https://github.com/tryretool/retool-onpremise#gcp-deploy-with-compute-engine-virtual-machine

# Instal the Ops Agent - https://cloud.google.com/stackdriver/docs/solutions/agents/ops-agent/installation#install-latest-version
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
bash add-google-cloud-ops-agent-repo.sh --also-install

# Clone Retool self-hosted repository
git clone https://github.com/tryretool/retool-onpremise.git
cd retool-onpremise

# Specify desired version number of Retool
sed -i 's/X.Y.Z/${version}/' Dockerfile

# Install docker container, docker & docker-compose
./install.sh

# Add license key
sed -i '/LICENSE_KEY=/c\LICENSE_KEY=${license_key}' docker.env

# Configure domain and HTTPS - https://docs.retool.com/docs/custom-internal-ca#connect-to-retool-with-https
sed -i '/DOMAINS=/c\DOMAINS=${domain} -> http://api:3000' docker.env
sed -i '/BASE_DOMAIN=/c\BASE_DOMAIN=https://${domain}' docker.env
sed -i "s/STAGE: 'local'/STAGE: 'production'/" docker-compose.yml

# Start the Retool docker containers
docker-compose up -d
