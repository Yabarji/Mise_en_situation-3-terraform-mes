terraform {
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

provider "helm"{
  kubernetes {
    host  = scaleway_k8s_cluster_beta.ingecloud-eks-01.kubeconfig[0].host
    token = scaleway_k8s_cluster_beta.ingecloud-eks-01.kubeconfig[0].token
    cluster_ca_certificate = base64decode(scaleway_k8s_cluster_beta.ingecloud-eks-01.kubeconfig[0].cluster_ca_certificate)
    load_config_file = false
  }
}
