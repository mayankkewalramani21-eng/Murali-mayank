%dw 2.0
output application/csv
fun getType(fieldValue, fieldType, fieldFormat) = if(fieldType == "Date")
    fieldValue as Date{format: fieldFormat} default null
    else if(fieldType == "DateTime")
    fieldValue as DateTime{format: fieldFormat} default null
    else if(fieldType == "LocalDateTime")
    fieldValue as LocalDateTime{format: fieldFormat} default null
    else if(fieldType == "Time")
    fieldValue as Time{format: fieldFormat} default null
    else if(fieldType == "LocalTime")
    fieldValue as LocalTime{format: fieldFormat} default null
    else
    fieldValue
fun replaceNewline(str) = str replace /[\n\r]/ with ""
---
(payload map (
    $ mapObject ((value, key, index) ->
    value match {
        case is Object -> (key) : (if((namesOf(value) contains "fieldValue"))(getType(value.fieldValue, value.fieldType, value.fieldFormat))
        else
        value)
        else -> (key) : value
    }
    )
)) map ((item, index) -> item mapObject ((value, key, index) -> (key): replaceNewline(value)))