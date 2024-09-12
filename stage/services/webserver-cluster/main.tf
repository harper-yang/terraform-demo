provider "aws" {
  region = "ap-southeast-2"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"
  cluster_name = "webserver-cluster-stage"
  remote_db_state_path = "stage/data-stores/mysql"
}
