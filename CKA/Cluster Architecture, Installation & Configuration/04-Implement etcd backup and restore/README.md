## etcd backup

Get the required etcd prameters from /etc/kubernetes/manifests/etcd.yaml

Backup command syntax

<code>
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=<ca-file> \
  --cert=<cert-file> \
  --key=<key-file> \
  snapshot save <backup-file-location>
</code>

Backup command with all paramters

<code>
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  snapshot save /opt/backup/etcd.db
</code>

## etcd restore

Restore command

<code>
ETCDCTL_API=3 etcdctl snapshot restore /opt/backup/etcd.db
</code>

For usign a differnt data directory

<code>
ETCDCTL_API=3 etcdctl --data-dir /opt/etcd snapshot restore /opt/backup/etcd.db
</code>
