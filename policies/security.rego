package main

deny[msg] {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot
  msg = "Containers must not run as root. Set securityContext.runAsNonRoot to true."
}

deny[msg] {
  input.kind == "Deployment"
  user := input.spec.template.spec.securityContext.runAsUser
  user == 0
  msg = "Containers must not run as root (user 0)."
}
