package demo.node.ID001

__rego_metadata__ := {
	"id": "ID001",
	"title": "npm Publish package with public access",
	"severity": "CRITICAL",
	"type": "Dockerfile Nodejs Custom Check - DEMO Node",
	"description": "npm Publish package with public access",
}

__rego_input__ := {"selector": [{"type": "dockerfile"}]}

deny[res] {
	add := input.stages[_][_]
	contains(add.Value[0], "--access public")

	res := sprintf("Publishes (an unsafe action) an npm application is not allowed: '%s'", [add.Value[0]])
}

