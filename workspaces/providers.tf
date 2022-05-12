terraform {
  cloud {
    organization = "TeraSky"

    workspaces {
      name = "tfe-demo"
    }
  }
}
