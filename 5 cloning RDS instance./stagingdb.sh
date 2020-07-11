snapshot_id=`aws rds describe-db-snapshots \
    --db-instance-identifier test-mysql \
    | grep DBSnapshotIdentifier \
    | sed 's/"/ /g' \
    | awk ' { print $(NF-1); } '`

subnetgroup_id=`aws rds describe-db-instances \
    --db-instance-identifier test-mysql \
    | grep DBSubnetGroupName \
    | sed 's/"/ /g' \
    | awk ' { print $(NF-1); } '`

securitygroup_id=`aws rds describe-db-instances \
    --db-instance-identifier test-mysql \
    | grep VpcSecurityGroupId \
    | sed 's/"/ /g' \
    | awk ' { print $(NF-1); } '`

aws rds restore-db-instance-from-db-snapshot \
    --db-instance-identifier testing \
    --db-snapshot-identifier $snapshot_id \
    --db-instance-class db.t2.micro \
    --storage-type gp2 \
    --publicly-accessible \
    --no-multi-az \
    --no-auto-minor-version-upgrade \
    --vpc-security-group-ids $securitygroup_id \
    --db-subnet-group-name $subnetgroup_id
