# ecs-consul


Server is a spot fleet, that has 3 spot fleets.

The reason for this is that we can't ditch all 3 nodes at a time, or bad things happen to the consensus.

If consensus is broken, try and fix, or redeploy and restore backup by connecting to a node and running:

`aws s3 cp s3://kloudcover/consul/<snapshot> here`

`consul snapshot restore here`
