data "tfe_organization" "terasky" {
  name = "terasky"
}

resource "tfe_workspace" "dev" {
  name         = "dev"
  organization = data.tfe_organization.terasky.name
  tag_names    = ["tfe-demo"]
  auto_apply = true
  trigger_prefixes = ["dev/"]
  working_directory = "dev/"
  vcs_repo {
    identifier     = "andel7/tfe-demo"
    oauth_token_id = "ot-yhaoJ6jzpGgPveNj"
  }
}

resource "tfe_workspace" "prod" {
  name         = "prod"
  organization = data.tfe_organization.terasky.name
  tag_names    = ["tfe-demo"]
  auto_apply = false
  trigger_prefixes = ["prod/"]
  working_directory = "prod/"
  vcs_repo {
    identifier     = "andel7/tfe-demo"
    oauth_token_id = "ot-yhaoJ6jzpGgPveNj"
  }
}
# Add runtask
