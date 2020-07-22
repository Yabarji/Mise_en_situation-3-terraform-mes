### Conf Security Group ###cluster Kubernetes ###
resource "scaleway_k8s_cluster_beta" "ingecloud-eks-01" {
  name = "ingecloud-eks-01"
  version = "1.18.6"
  cni = "cilium"
}

resource "scaleway_k8s_pool_beta" "ingecloud-eks-s01" {
  cluster_id = scaleway_k8s_cluster_beta.ingecloud-eks-01.id
  name = "ingecloud-eks-01"
  node_type = "DEV1-M"
  size = 2
}
