# Docker-kdc

Minimal docker KDC server and client for testing purposes.
The main intention is to have 2 docker images:
* KDC: this is a KDC server where a headless principal named `user` added and a keytab stored in the shared directory
(depends on deployment)
* Client: a kerberos client which uses the server created keytab to obtain a TGT

## How to build
```
git clone https://github.com/gaborgsomogyi/docker-kdc.git
cd docker-kdc

eval $(minikube docker-env)
docker-compose build
```

## How to run KDC
Here one can choose from 2 deployments:
* K8S
```
mkdir -p ${HOME}/share
minikube start --mount-string="${HOME}/share:/share" --mount
kubectl apply -f kdc.yaml
kubectl delete pod/kdc
```

* Docker
```
./run-kdc.sh
```

## Access the KDC container
* K8S
```
kubectl exec -it kdc -- bash
```

* Docker
```
docker exec -it kdc bash
```

## How to run Client
Please note client is only compatible with the docker based KDC server deployment!
```
./run-client.sh
...
# When everything works fine similar messages must appear in console
===================================================================================
==== Testing ======================================================================
===================================================================================
Authenticating as principal kadmin/admin@EXAMPLE.COM with password.
kadmin/admin@EXAMPLE.COM
KDC and Kadmin are operational

klist before TGT obtain
klist: No credentials cache found (filename: /tmp/krb5cc_0)
klist after TGT obtain
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: user@EXAMPLE.COM

Valid starting     Expires            Service principal
04/06/22 13:07:52  04/07/22 13:07:52  krbtgt/EXAMPLE.COM@EXAMPLE.COM
root@5e30644e95d7:/# 
```
