### Conf Security Group ###cluster Kubernetes ###
resource "scaleway_k8s_cluster_beta" "s01-yassen" {
  name = "s01-yassen"
  version = "1.18.0"
  cni = "cilium"
}

resource "scaleway_k8s_pool_beta" "s01-yassen" {
  cluster_id = scaleway_k8s_cluster_beta.jack.id
  name = "s01-yassen"
  node_type = "DEV1-M"
  size = 2
}
