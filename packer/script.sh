stop ecs
yum update -y
yum install wget zip aws-cli jq nfs-utils aws-cfn-bootstrap -y
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
cd ..


# consul
wget https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip
unzip consul_1.2.2_linux_amd64.zip
mv consul /usr/bin
chmod +x /usr/bin/consul

# run this in the cloudformation
# s3fs fetchit /mnt/consul -o iam_role="role of instance"
