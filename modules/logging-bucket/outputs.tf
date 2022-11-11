/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "as_logging_destination" {
  description = "Parameters to use this bucket as a log sink destination."
  value = {
    type = "logging"
    target = try(
      google_logging_project_bucket_config.bucket.0.id,
      google_logging_folder_bucket_config.bucket.0.id,
      google_logging_organization_bucket_config.bucket.0.id,
      google_logging_billing_account_bucket_config.bucket.0.id,
    )
  }
}

output "id" {
  description = "ID of the created bucket."
  value = try(
    google_logging_project_bucket_config.bucket.0.id,
    google_logging_folder_bucket_config.bucket.0.id,
    google_logging_organization_bucket_config.bucket.0.id,
    google_logging_billing_account_bucket_config.bucket.0.id,
  )
}
