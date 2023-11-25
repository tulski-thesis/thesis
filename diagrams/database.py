from diagrams import Diagram
from diagrams.k8s.compute import Deployment, Pod, ReplicaSet, StatefulSet
from diagrams.k8s.network import Ingress, Service
from diagrams.k8s.storage import PersistentVolume, PersistentVolumeClaim

with Diagram(filename="kubernetes-database", show=True):



    ingress = Ingress("*.tulski.com\nNGINX ingress")

    storefront_svc = Service("store.tulski.com\nstorefront")
    storefront = Pod("storefront")
    ingress >> storefront_svc >> storefront

    backend_svc = Service("api.tulski.com\nbackend")
    backend = Pod("backend")
    ingress >> backend_svc >> backend

    admin_panel_svc = Service("admin.tulski.com\nadmin-panel")
    admin_panel = Pod("admin-panel")
    ingress >> admin_panel_svc >> admin_panel

    db = StatefulSet("db\npostgres")
    db_pvc = PersistentVolumeClaim("postgres-pvc")
    db_pv = PersistentVolume("postgres-pv")
    backend >> db << db_pvc << db_pv
