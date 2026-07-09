%dw 2.0
output application/json
---
{
	"application": payload."application" default Mule::p('api.name'),
	"flowName": payload."flowName" default "",
	"source": payload."source",
	"destination": payload."destination",
	"correlationId": payload."correlationId",
	"timestamp": payload."timestamp" default now()
}