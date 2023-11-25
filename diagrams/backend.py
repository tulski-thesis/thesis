from diagrams import Diagram
from diagrams.k8s.compute import Deployment, Pod, StatefulSet
from diagrams.k8s.network import Ingress, Service
from diagrams.k8s.podconfig import Secret
from diagrams.custom import Custom


with Diagram(show=True, filename="kubernetes-backend"):
    vs = Custom("Virtual Server\nbackend", "./resources/NGINX-Ingress-Controller-product-icon.svg")
    cert = Secret("TLS Secret \nbackend-certificate")
    sm = Custom("Service Monitor\nbackend-sm", "./resources/prometheus-icon.png")
    svc = Service("ClusterIP Service\nbackend")
    dp = Deployment("Deployment\nbackend")
    pod = Pod("Pod\nbackend")
    db = Service("ClusterIP Service\nstore-db-postgresql")
    secret = Secret("Secret\nbackend-secrets")

    vs >> cert
    vs >> svc
    sm >> svc
    svc >> dp
    dp >> pod
    pod >> db
    pod >> secret
