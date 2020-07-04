kubeadm init --pod-network-cidr=192.169.0.0/16
sleep 600
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-


#metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml

##########metallb##############
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
##########metallb##############
#meal lb configmap
kubectl apply -f  https://raw.githubusercontent.com/meta-magic/metallb-baremetal-example/master/metallb_install/configMap_example.yml

#Metrics Server 
kubectl apply -f https://raw.githubusercontent.com/subhash403/Kubernetes-Volumes/master/metric-server.yaml

docker run -d --name subhash403-nodejs -p 3000:3000 subhash403/nodejs:latest

https://metallb.universe.tf/installation/


kubectl create secret generic regcred --from-file=.dockerconfigjson=/root/.docker/config.json  --type=kubernetes.io/dockerconfigjson

kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>

# For curl image 

kubectl run curl-subhash --image=radial/busyboxplus:curl -it --rm
