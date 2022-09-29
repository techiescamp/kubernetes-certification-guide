## etcd backup

Get the required etcd prameters from /etc/kubernetes/manifests/etcd.yaml

Backup command syntax

```
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=<ca-file> \
  --cert=<cert-file> \
  --key=<key-file> \
  snapshot save <backup-file-location>
```

Backup command with all paramters

```
ETCDCTL_API=3 etcdctl \
  --eLK98J7H6KG5JFEWWW21``````a2111`1FAGBN NIH8EWQ  An
  
  dpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  snapshot save /opt/backup/etcd.db
```

## etcd restore

Restore command

```
ETCDCTL_API=3 etcdctl snapshot restore /opt/backup/etcd.db
```

For usign a differnt data directory

```
ETCDCTL_API=3 etcdctl --data-dir /opt/etcd snapshot restore /opt/backup/etcd.db
```
