variable "project" {
    type = string
}

variable "environment" {
    type = string
}

variable "sns_topic_warn" {
  type      = string 
  default   = null 
}

variable "sns_topic_danger" {
  type      = string 
  default   = null 
}

variable "linked_account" {
  type      = string
  default   = null
}

variable "evaluation_period" {
  type      = string
  default   = "21600"
}

variable "warn" {
  type = map
  default = {
      Currency = "USD"
      Amount   = "5.00"
  }
}

variable "danger" {
  type = map
  default = {
      Currency = "USD"
      Amount   = "15.00"
  }
}

variable "tags" {
  type      = map(any)
  default   = {}
}