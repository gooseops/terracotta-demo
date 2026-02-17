module "terracotta_demo" {
  source         = "github.com/gooseops/ops.git/terraform/modules/gcp/compute_engine/1.0.0"
  name           = "terracotta-demo"
  admin_user     = data.doppler_secrets.prod_secrets.map.HOMELAB_ADMIN_USER
  admin_pubkey   = data.doppler_secrets.prod_secrets.map.HOMELAB_PUB_KEY
  zone           = "us-east1-c"
  machine_type   = "e2-micro"
  tags           = ["terracotta-demo"]
  boot_disk_size = 10
}
