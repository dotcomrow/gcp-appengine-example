resource "google_service_account" "gae_service_account" {
  account_id   = "gae-service-account"
  display_name = "GAE Service Account"
}

resource "google_app_engine_standard_app_version" "gae-appengine-example" {
    version_id      = "v2"
    service         = "gae-appengine-example"
    runtime         = "java17"
    app_engine_apis = true
    service_account = google_service_account.gae_service_account.email

    env_variables = {
        port = "8080"
    }

    entrypoint {
        shell = "java -Xmx128m -jar gcp-appengine-example.jar"
    }

    deployment {
        zip {
            source_url = "https://storage.googleapis.com/dotcomrow-gcp-appengine-example/gcp-appengine-example.jar"
        }
    }
}