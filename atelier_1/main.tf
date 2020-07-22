### Conf Security Group ###cluster Kubernetes ###
resource "scaleway_k8s_cluster_beta" "ingecloud-eks-01" {
  name = "s01-yassen"
  version = "1.18.6"
  cni = "cilium"
}

resource "scaleway_k8s_pool_beta" "ingecloud-eks-01" {
  cluster_id = scaleway_k8s_cluster_beta.s01-yassen.id
  name = "s01-yassen"
  node_type = "DEV1-M"
  size = 2
}
