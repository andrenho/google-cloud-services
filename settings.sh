WEBSITE_BUCKET='website-learn-andrenho'
STORAGE_BUCKET='storage-learn-andrenho'
SERVICE_ACCOUNT='service-account-andrenho'
INSTANCE_NAME='learn-instance'

get_service_account() {
  local r=$(gcloud iam service-accounts list --filter="displayName:$SERVICE_ACCOUNT" --format="value(email)")
  echo "$r"
}
