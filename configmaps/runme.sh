kubectl create namespace test

# start in grouper-main
cd configmaps/

# Grouper Secrets
cd grouper
kubectl create configmap subject-properties --from-file=subject.properties -n test --save-config
kubectl create configmap grouper-loader-properties --from-file=grouper-loader.properties -n test --save-config
kubectl create configmap rabbitmq-password --from-file=rabbitmq_password.txt -n test --save-config
kubectl create configmap database-password --from-file=database_password.txt -n test --save-config
kubectl create configmap grouper-hibernate-properties --from-file=grouper.hibernate.properties -n test --save-config
kubectl create configmap grouper-properties --from-file=grouper.properties -n test --save-config
kubectl create configmap grouper-client-properties --from-file=grouper.client.properties -n test --save-config
kubectl create configmap grouper-sp  --from-file=grouper-sp.xml -n test --save-config

# httpd secrets
cd ../httpd
kubectl create configmap host-cert --from-file=host-cert.pem -n test --save-config
kubectl create configmap host-key --from-file=host-key.pem -n test --save-config
kubectl create configmap cachain --from-file=cachain-cer.pem -n test --save-config

# shibboleth secrets
cd ../shibboleth
kubectl create configmap sp-cert --from-file=sp-cert.pem -n test --save-config
kubectl create configmap sp-key --from-file=sp-key.pem -n test --save-config
kubectl create configmap shibboleth2 --from-file=shibboleth2.xml -n test --save-config
kubectl create configmap idp-metadata --from-file=idp-metadata.xml -n test --save-config