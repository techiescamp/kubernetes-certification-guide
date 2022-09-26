#! /bin/bash

# Required Variable Declaration for ec2 creation
VPC_ID="vpc-0d42bf2f27be967ff"
SUBNET_ID="subnet-00b5ede5e160caa59"
AMI_ID="ami-0ddf424f81ddb0720"
INSTANCE_TYPE="t2.small"
KEY_NAME="k8s-key"
APP_NAME="k8s"


# Creating Security Group

SECURITY_GROUP_ID=$(aws ec2 create-security-group \
    --group-name $APP_NAME-sg \
    --description "$APP_NAME SG" \
    --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value="'$APP_NAME'-sg"}]' \
    --vpc-id $VPC_ID \
    --query 'GroupId' --output text)

if [ $? == 0 ]
then
  echo "$SECURITY_GROUP_ID Security Group Created"
else
  echo "Error: Creating Security Group"
  exit
fi

# Adding Security Group Ingress Rules

INGRESS=$(aws ec2 authorize-security-group-ingress \
    --group-id $SECURITY_GROUP_ID \
    --tag-specifications 'ResourceType=security-group-rule,Tags=[{Key=Name,Value='$APP_NAME'-sg}]' \
    --ip-permissions "IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges=[{CidrIp=0.0.0.0/0}]" \
    --ip-permissions "IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges=[{CidrIp=0.0.0.0/0}]")

if [ $? == 0 ]
then
  echo "Security Group Ingress Created"
else
  echo "Error: Creating Security Group Ingress Rules"
  exit
fi

# Creating SSH Key and Adding it to .ssh Directory

SSH_KEY=$(aws ec2 create-key-pair \
  --key-name  $KEY_NAME \
  --query 'KeyMaterial' --output text)

if [ $? == 0 ]
then
  echo "ec2 Key "$KEY_NAME" Created"
else
  echo "Error: Creating Key Failed"
  exit
fi

echo "$SSH_KEY" > ~/.ssh/devops-class/$KEY_NAME

# Creating  ec2 instance"

INSTANCE=$(aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --block-device-mappings "[{\"DeviceName\":\"/dev/sda1\",\"Ebs\":{\"VolumeSize\":20,\"DeleteOnTermination\":false}}]" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$APP_NAME'-server}]' 'ResourceType=volume,Tags=[{Key=Name,Value='$APP_NAME'-server-disk}]')


if [ $? == 0 ]
then
  echo "$APP_NAME ec2 instance Created"
else
  echo "Error: $APP_NAME ec2 Instance Creation Failed"
fi

# cleanup() {
#      aws ec2 delete-key-pair --key-name  $KEY_NAME  
     
#      aws ec2 delete-security-group \
#         --group-name wp-sg \
#         --vpc-id $VPC_ID

# }


