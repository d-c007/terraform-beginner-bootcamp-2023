terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "ExamPro"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Dune"
  description = <<DESCRIPTION
  Dune is a visually stunning and epic science fiction film, directed by Denis Villeneuve and released in 2021. 
  It's based on the classic novel of the same name by Frank Herbert. The story takes place on the desert planet of Arrakis, the only source of a valuable spice called "melange." The film follows the journey of Paul Atreides, a young noble, as he becomes embroiled in a complex power struggle for control of Arrakis and its resources. With a star-studded cast, including Timothée Chalamet and Zendaya, "Dune" combines intricate world-building with themes of politics, religion, and destiny, resulting in a highly acclaimed and visually spectacular cinematic experience.
  DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "rivervalleybackroads.cloudfront.net"
  town = "video-valley"
  content_version = 1
}