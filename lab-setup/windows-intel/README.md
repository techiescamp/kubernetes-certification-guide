
# Vagrantfile and Scripts to Automate Kubernetes Setup using Kubeadm [Practice Environment for CKA/CKAD and CKS Exams]

## Documentation

Current k8s version for CKA, CKAD, and CKS exam: 1.28

## For Windows Users

## Prerequisites

1. Vagrant

    Installation Link: https://developer.hashicorp.com/vagrant/install#Windows

2. Virtual Box

    Installation Link: https://www.virtualbox.org/wiki/Downloads
3. Minimum 8 GB of RAM Required.

## Bring Up the Cluster

To provision the cluster, execute the following commands on Powershell.

```shell
git clone https://github.com/arunlalp/kubernetes-certification-guide.git
cd kubernetes-certification-guide/lab-setup/windows-intel
vagrant up
```
## To get into the Master Node,

```powershell
vagrant ssh master
```

## To exit from the cluster,

```powershell
exit
```

## To shutdown the cluster,

```shell
vagrant halt
```

## To restart the cluster,

```shell
vagrant up
```

## To destroy the cluster,

```shell
vagrant destroy
```



> **Note:** When perform up, destroy or halt, you should be in this `kubernetes-certification-guide/lab-setup/windows-intel` directory. 
