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
