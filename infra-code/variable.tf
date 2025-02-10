variable "image_name" {
  description = "The image name."
  type        = string
  default     = "ghcr.io/buraito-kun/devops-assignment"
}

variable "image_version" {
  description = "App version tag in image"
  type        = string
  default     = "latest"
}
