terraform {
  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "~> 1.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "doppler" {
  doppler_token = var.doppler_token
}

provider "cloudflare" {
  api_token = data.doppler_secrets.prod_secrets.map.CLOUDFLARE_API_TOKEN
}

provider "google" {
  project     = "gooseops-quota-project"
  region      = "us-east1"
  credentials = data.doppler_secrets.prod_secrets.map.GOOSEOPS_GCP_SA_CREDS
}
