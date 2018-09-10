# ecs-consul


Server is a spot fleet, that has a fuse s3 mount that it backs up stuff to.

If it starts, I want it to load from that.

I'm gonna have to make a consul AMI probably that does this:

- iam role will probably have to have s3 delete stuff


Stuff
```
yum install wget zip -y
```

```
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse/
./autogen.sh
./configure --prefix=/usr
make
make install
s3fs fetchit /mnt/mydata -o iam_role="role of instance"
cd ..
```

maybe install golang for consul

```

wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.11.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

then install consul

```
wget https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip
unzip consul_1.2.2_linux_amd64.zip
mv consul /usr/bin
chmod +x /usr/bin/consul
```
