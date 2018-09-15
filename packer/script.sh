stop ecs

yum update -y
yum install wget \
            unzip \
            git \
            zip \
            aws-cli \
            gcc gcc-c++ autoconf automake fuse-devel curl-devel libxml2-devel openssl-devel htop \
            jq nfs-utils aws-cfn-bootstrap -y
echo 'DOCKER_STORAGE_OPTIONS="--storage-driver overlay2"' > /etc/sysconfig/docker-storage
service docker restart

# s3 fuse
mkdir -p /mnt/consul
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse/
./autogen.sh
./configure --prefix=/usr
make
make install
# mv src/s3fs /usr/bin/s3fs
cd ..


# consul
export VERSION=1.2.3 && \
wget https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_linux_amd64.zip && \
unzip consul_${VERSION}_linux_amd64.zip && \
mv consul /usr/bin && \
chmod +x /usr/bin/consul

rm /etc/init/ecs.conf
