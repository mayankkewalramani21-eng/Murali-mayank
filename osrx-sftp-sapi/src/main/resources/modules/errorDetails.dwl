%dw 2.0
output application/json
---
{
	"type": payload."type" default "Unknown",
	"description": payload."description" default "Unknown",
	"payload": payload."payload" default ""
}