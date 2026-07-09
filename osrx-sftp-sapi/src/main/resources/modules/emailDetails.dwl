%dw 2.0
output application/json
---
{
	"from": payload."from",
	"toList": payload."toList" default ["sample@email.com"],
	"subject": payload."subject" default "Mulesoft Error alert",
	"attachments": payload."attachments" default null
}