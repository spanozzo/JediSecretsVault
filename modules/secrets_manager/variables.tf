variable "jedi_secret_name" {
  description = "secret name for the JediID"
  type        = string
}

variable "jedi_secret_value" {
  description = "The value of the JediID secret"
  type        = string
  sensitive   = true
}