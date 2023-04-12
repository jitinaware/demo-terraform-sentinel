terraform {
  cloud {
    organization = "jaware-hc-demos"

    workspaces {
      name = "demo-terraform-sentinel"
    }
  }
}