package mycontainer.docker.ID002

__rego_metadata__ := {
	"id": "ID002",
	"title": "npm Publish package with public access",
	"severity": "LOW",
	"type": "Dockerfile Nodejs Custom Check - DEMO Node",
	"description": "npm Publish package with public access",
}

__rego_input__ := {"selector": [{"type": "dockerfile"}]}

allow[res] {
	add := input.stages[_][_]
	contains(add.Value[0], "LABEL")

	res := sprintf("LABEL (an unsafe action) an npm application is not allowed: '%s'", [add.Value[0]])
}

