resource "google_service_account" "gae_service_account" {
  account_id   = "gae-service-account"
  display_name = "GAE Service Account"
}

resource "google_app_engine_application" "app" {
    version_id      = "v2"
    service         = "gae-appengine-example"
    runtime         = "java17"
    app_engine_apis = true
    location_id = "us-east1"
    service_account = google_service_account.gae_service_account.email

    env_variables = {
        port = "8080"
    }
}