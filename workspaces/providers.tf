terraform {
  backend "remote" {
    organization = "TeraSky"

    workspaces {
      name = "tfe-demo"
    }
  }
}
