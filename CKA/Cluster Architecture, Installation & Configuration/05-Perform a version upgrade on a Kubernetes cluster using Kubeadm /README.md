## Master Node Upgrade
<code>
sudo apt update
sudo apt-cache madison kubeadm | tac
</code>

Run upgrade plan

<code>
sudo kubeadm upgrade plan
</code>

unhold kubeadm and Install the required version

<code>
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm=1.24.6-00 && \
sudo apt-mark hold kubeadm
</code>

Apply Kubeadm upgrade

<code>
sudo kubeadm upgrade node
</code>

Drain the Node.

<code>
kubectl drain master-node --ignore-daemonsets

Upgrade Kubelet and Kubectl

<code>
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet=1.24.6-00 kubectl=1.24.6-00 && \
sudo apt-mark hold kubelet kubectl
</code>

Restrat kubelet

<code>
sudo systemctl daemon-reload
sudo systemctl restart kubelet
</code>

<code>
kubectl uncordon master-node
</code>

## Worker Node Upgrade

Unhold Kubeadm and Install Required Version

<code>
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm=1.24.6-00 && \
sudo apt-mark hold kubeadm
</code>

Upgrde Kubeadm

<code>
sudo kubeadm upgrade node
</code>

Drain the Node

<code>
kubectl drain worker-node01 --ignore-daemonsets
</code>

Upgrade Kubelet & Kubectl

<code>
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet=1.24.6-00 kubectl=1.24.6-00 && \
sudo apt-mark hold kubelet kubectl
</code>

Restart kubelet

<code>
sudo systemctl daemon-reload
sudo systemctl restart kubelet
</code>

Uncordon worker node

<code>
kubectl uncordon worker-node01
</code>

