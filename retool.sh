# Retool install
# https://github.com/tryretool/retool-onpremise#gcp-deploy-with-compute-engine-virtual-machine

# Clone Retool self-hosted repository
git clone https://github.com/tryretool/retool-onpremise.git
cd retool-onpremise

# Specify desired version number of Retool
sed -i 's/X.Y.Z/${version}/' Dockerfile

# Install docker container, docker & docker-compose
./install.sh

# Add license key
sed -i 's/EXPIRED-LICENSE-KEY-TRIAL/${license_key}/' docker.env

# Access before configuring HTTPS
sed -i '/COOKIE_INSECURE/c\COOKIE_INSECURE=true/' docker.env

docker-compose up -d