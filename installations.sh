#docker
curl https://get.docker.com |bash

#kubernetes
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl -> this will make everyone access kubectl
kubectl version

#EKSCTL
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo install -m 0755 /tmp/eksctl /usr/local/bin 

sudo mv /tmp/eksctl /usr/local/bin

eksctl version 

attach IAM role to ec2 instance
sudo snap install aws-cli --classic
git clone https://github.com/sandeepsai530/terraform.git
eksctl create cluster --config-file=eks.yaml
aws eks update-kubeconfig --name expense1 --region us-east-1
eksctl delete cluster --config-file=eks.yaml

#kubens
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
kubens expense

#EBS drivers
create a volume in same AZ as EC2 node
install ebs csi driver
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.46"
verify using: kubectl get pods -n kube-system
attach policy EBSCSIDriver to IAM role of the node

#EFS drivers
install efs csi driver
kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/ecr/?ref=release-2.1" > private-ecr-driver.yaml
attach policy EBSCSIDriver to IAM role of the node
create an EFS file system

#HELM installation
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh