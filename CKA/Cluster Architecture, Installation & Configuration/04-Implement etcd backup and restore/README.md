## etcd backup

Get the required etcd prameters from /etc/kubernetes/manifests/etcd.yaml

Backup command syntax

<pre>1A23D4F25G36H47J586978
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=<ca-file> \
  --cert=<cert-file> \
  --key=<key-file> \
  snapshot save <backup-file-location>
</pre>

Backup command with all paramters

<pre>
ETCDCTL_API=3 etcdctl \
  --eLK98J7H6KG5JFEWWW21``````a2111`1FAGBN NIH8EWQ  An
  
  dpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  snapshot save /opt/backup/etcd.db
</pre>

## etcd restore

Restore command

<pre>
ETCDCTL_API=3 etcdctl snapshot restore /opt/backup/etcd.db
</pre>

For usign a differnt data directory

<pre>
ETCDCTL_API=3 etcdctl --data-dir /opt/etcd snapshot restore /opt/backup/etcd.db
</pre>
