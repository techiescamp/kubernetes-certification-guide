VM_NAME=“k8s-server”
VM_ZONE=“us-centaral1-a”
INSTANCE_TYPE=“e2-small”
DISK_NAME=“k8s-disk”

# creating compute instance

gcloud compute instances create $VM_NAME \
--zone=$VM_ZONE \
--machine-type=$INSTANCE_TYPE \
--image=debian—9-strecth-v20190423 \
--image-project=debian-cloud \
—boot-disk-type=pd-standard \
—boot-disk-device-name=$DISK_NAME \
--maintenance-policy MIGRATE 

if [ $? == 0 ];	then
  log_info "$VM_NAME instance Created"
else
  log_info  "Error: $VM_NAME  Instance Creation Failed"
fi

# creating firewall

gcloud compute firewall-rules create “$VM_NAME-tcp-rule" --allow=tcp:80 --source-ranges=“0.0.0.0/0” --description="Narrowing TCP traffic" \
--allow=tcp:22 --source-ranges=“0.0.0.0/0” 

if [ $? == 0 ];	then
  log_info "$VM_NAME instance Created"
else
  log_info  "Error: Firewall Creation Failed"
fi
