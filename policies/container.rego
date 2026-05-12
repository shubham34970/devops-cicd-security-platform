package main

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  endswith(container.image, ":latest")
  msg = sprintf("Container '%v' is using the ':latest' tag. Explicit version tags must be used.", [container.name])
}

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  not contains(container.image, ":")
  msg = sprintf("Container '%v' has no version tag specified. Explicit version tags must be used.", [container.name])
}

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  container.securityContext.privileged == true
  msg = sprintf("Container '%v' is running in privileged mode. This is strictly forbidden.", [container.name])
}
