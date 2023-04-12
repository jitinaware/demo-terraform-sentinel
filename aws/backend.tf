terraform {
  cloud {
    organization = "jaware-hc-demos"

    workspaces {
      name = "demo-tfe-sentinel-aws"
    }
  }
}