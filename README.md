# nc-pod

This is a fork of https://github.com/sostheim/nc-pod simplified for my needs. Just deploys `netcat` to a pod, listening UDP on 2055. Change `pod.yaml` to adapt command line.

## Build with podman

```bash
podman build --rm --tag quay.io/jotak/nc .
podman push quay.io/jotak/nc:latest
```

## Run it

```bash
kubectl apply -f pod.yaml
```

Get pod IP:

```bash
NC_IP=`kubectl get pod nc -o json | jq -r '.status.podIPs[0].ip'` && echo $NC_IP
```

Test / write some data:

```bash
kubectl run -i alps --image=alpine:latest &
# Change the IP
kubectl exec -it alps /bin/ash -- nc -n -u $NC_IP 2055
```

Dump:

```bash
kubectl logs nc > nc.dump
```

Note, in UDP mode netcat "locks on" the first host that emits data, so if you restart the `alps` pod or change the emitter, you would need to restart the `nc` pod as well.

## Delete

```bash
kubectl delete pod nc
kubectl delete pod alps
```
