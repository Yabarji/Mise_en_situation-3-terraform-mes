required_providers {
    scaleway = {
      source = "terraform-providers/scaleway"
      version = "~> 1.15"
    }
  }
  required_version = "~> 0.12"
}

provider "scaleway" {
}

### Conf Security Group ###cluster Kubernetes ###
resource "scaleway_k8s_cluster_beta" "ingecloud-eks-01" {
  name = "ingecloud-eks-01"
  version = "1.18.6"
  cni = "cilium"
}

resource "scaleway_k8s_pool_beta" "ingecloud-eks-01" {
  cluster_id = scaleway_k8s_cluster_beta.ingecloud-eks-01.id
  name = "ingecloud-eks-01"
  node_type = "DEV1-M"
  size = 2
}

provider "helm" {
  kubernetes {
    host = scaleway_k8s_cluster_beta.foobar.kubeconfig[0].host
    token = scaleway_k8s_cluster_beta.foobar.kubeconfig[0].token
    cluster_ca_certificate =  base64decode(scaleway_k8s_cluster_beta.ingecloud-eks-05.kubeconfig[0].cluster_ca_certificate)
    load_config_file = false
  }
}

 # maint.tf
 # service.tf
 resource "helm_release" "kubeapps" {
  name       = "kubeapps"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kubeapps"
  version    = "3.7.4"
  namespace  = "kubeapps"
  create_namespace  = true

  set {
    name  = "useHelm3"
    value = "true"
  }
}

