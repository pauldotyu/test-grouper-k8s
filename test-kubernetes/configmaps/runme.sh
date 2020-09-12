kubectl create namespace test

# start in grouper-main
cd configmaps

# Grouper Secrets
# Run in https://github.internet2.edu/docker/grouper/tree/main/test-compose/configs-and-secrets/grouper
cd grouper
kubectl create configmap subject-properties --from-file=subject.properties -n test
kubectl create configmap grouper-loader-properties --from-file=grouper-loader.properties -n test
kubectl create  configmap rabbitmq-password --from-file=rabbitmq_password.txt  -n test
kubectl create  configmap database-password --from-file=database_password.txt  -n test
kubectl create  configmap  grouper-hibernate-properties --from-file=grouper.hibernate.properties  -n test
kubectl create  configmap grouper-properties --from-file=grouper.properties  -n test
kubectl create  configmap grouper-client-properties  --from-file=grouper.client.properties  -n test

# httpd secrets
# Run in https://github.internet2.edu/docker/grouper/tree/main/test-compose/configs-and-secrets/httpd
cd ../httpd
kubectl create configmap host-cert --from-file=host-cert.pem -n test
kubectl create configmap cachain --from-file=cachain-cer.pem -n test
kubectl create configmap  host-key  --from-file=host-key.pem -n test

# shibboleth secrets
# Run in https://github.internet2.edu/docker/grouper/tree/main/test-compose/configs-and-secrets/shibboleth
cd ../shibboleth
kubectl create configmap sp-cert --from-file=sp-cert.pem -n test
kubectl create configmap sp-key --from-file=sp-key.pem -n test
kubectl create configmap shibboleth2 --from-file=shibboleth2.xml -n test
kubectl create configmap idp-metadata --from-file=idp-metadata.xml -n test 

cd ../../

kubectl apply -f . -n test

kubectl get all -n test

kubectl delete namespace test

kubectl logs ui-6cb767b9f6-sqcr7 -n test
kubectl exec -it ui-6cb767b9f6-sqcr7 -n test -- /bin/bash

kubectl port-forward service