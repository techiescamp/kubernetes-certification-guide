
# Vagrantfile and Scripts to Automate Kubernetes Setup using Kubeadm [Practice Environment for CKA/CKAD and CKS Exams]

## Documentation

Current k8s version for CKA, CKAD, and CKS exam: 1.28

Refer to this link for documentation: https://devopscube.com/kubernetes-cluster-vagrant/

## CKA, CKAD, CKS, or KCNA Coupon Codes

As part of our commitment to helping the DevOps community save money on Kubernetes Certifications, we continuously update the latest voucher codes from the Linux Foundation

- 🚀  CKA, CKAD, CKS, or KCNA exam aspirants can **save 35%** today using code **HOLIDAY23COM** at https://kube.promo/devops. It is a limited-time offer from the Linux Foundation.

The following are the best bundles to **save 35% + Extra Discount** with code **HOLIDAY23**

- CKA + CKAD + CKS Exam bundle ($407 Savings): [kube.promo/k8s-bundle](https://kube.promo/k8s-bundle)
- CKA + CKS Bundle ($308 Savings) [kube.promo/bundle](https://kube.promo/bundle)
- KCNA + CKA ( $170 Savings) [kube.promo/kcka-bundle](https://kube.promo/kcna-cka)

>Note: You have one year of validity to appear for the certification exam after registration


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
