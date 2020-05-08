helm create <chart name>

helm install --name=my-nginx . --set replicaCount=2

helm inspect values .

helm list

helm inspect values . > /tmp/nginx.values

helm install --name=my-nginx . --values /tmp/nginx.values

helm rollback my-nginx 2


# #### helm added to repo  ################


# `helm package tomcat`

echo "# helm-tomcat" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/subhash403/helm-tomcat.git
git push -u origin master

#For Creating index.yaml file for helm repo
# `helm repo index --url https://subhash403.github.io/helm-tomcat/ .`

#url path of the index.yaml form github
# `helm repo add tomcat https://raw.githubusercontent.com/subhash403/helm-tomcat/master/`


