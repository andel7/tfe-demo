variable "allowed_ip" {
  type = list(string)
  description = "List of allowed IPs"
  default = ["1.1.1.1/32","1.1.1.2/32","1.1.1.1/32"]
}