### Conf Security Group ###cluster Kubernetes ###
resource "scaleway_k8s_cluster_beta" "ingecloud-eks-s01" {
  name = "ingecloud-eks-s01
  version = "1.18.6"
  cni = "cilium"
}

resource "scaleway_k8s_pool_beta" "ingecloud-eks-s01" {
  cluster_id = scaleway_k8s_cluster_beta.ingecloud-eks-s01.id
  name = "ingecloud-eks-s01"
  node_type = "DEV1-M"
  size = 2
}
