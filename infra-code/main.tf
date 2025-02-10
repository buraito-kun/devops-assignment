terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment_v1" "deployment" {
  metadata {
    name = "backend-apps"
    labels = {
      app = "backend-apps"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "backend-apps"
      }
    }
    template {
      metadata {
        labels = {
          app = "backend-apps"
        }
      }
      spec {
        container {
          name              = "backend-apps"
          image             = "${var.image_name}${var.image_version}"
          image_pull_policy = "IfNotPresent"
          resources {
            limits = {
              cpu    = "250m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}
