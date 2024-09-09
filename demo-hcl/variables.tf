variable "app_name" {
  type    = string  # Define type as string
  default = "Hello World App"  # Set default value
  
  # Ensure at least 8 characters
  validation {
    condition     = length(var.app_name) >= 8  
    error_message = "The app_name must be at least 8 characters."
  }
}

output "app" {
    value = var.app_name
}