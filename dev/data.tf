data "terraform_remote_state" "allowed_ip" {
  backend = "remote"

  config = {
    organization = "TeraSky"
    workspaces = {
      name = "tfe-demo"
    }
  }
}