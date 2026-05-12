package main

deny[msg] {
  input.kind == "Deployment"
  not input.metadata.namespace
  msg = "Deployments must specify a namespace."
}

deny[msg] {
  input.kind == "Deployment"
  input.metadata.namespace == "default"
  msg = "Deployments must not use the 'default' namespace."
}

deny[msg] {
  input.kind == "Deployment"
  replicas := input.spec.replicas
  replicas < 2
  msg = sprintf("Deployments must have at least 2 replicas for high availability. Found %v", [replicas])
}
