from diagrams import Cluster, Diagram
from diagrams.oci.network import InternetGateway, LoadBalancer
from diagrams.oci.compute import VM
from diagrams.c4 import SystemBoundary


with Diagram(direction="TB", filename="oci-infrastructure", show=True):

    internet = InternetGateway("Internet")

    with SystemBoundary("Virtual Cloud Network\nsubnet-20230313-1902"):
        lb = LoadBalancer("Network Load Balancer\nk8s")

        lb >> [VM("Instance\nc1"),
               VM("Instance\nc2"),
               VM("Instance\nc3"),
               VM("Instance\nc4")]

    internet >> lb