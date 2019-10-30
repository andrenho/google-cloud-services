WEBSITE_BUCKET='website-learn-andrenho'
STORAGE_BUCKET='storage-learn-andrenho'
SERVICE_ACCOUNT='service-account-andrenho'
INSTANCE_NAME='learn-instance'
DNS_ZONE='learn-gcp'
DOMAIN='learn-gcp.gamesmith.uk'
BACKEND_SERVICE='web-backend-service'
VPC_NAME='learn-vpc'

get_service_account() {
  local r=$(gcloud iam service-accounts list --filter="displayName:$SERVICE_ACCOUNT" --format="value(email)")
  echo "$r"
}
