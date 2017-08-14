# Round - Compare Location

## Endpoint
`GET https://questionamble.herokuapp.com/rounds/{id}`

## Request Example
```
GET https://questionamble.herokuapp.com/rounds/6
```

## Response
On success, the HTTP status code in the response header is 200 OK and the response body contains a response in JSON format.

## Example
```
{
  clue: "found"
}
```
*Response body if the player location matches the clue location*
```
{
  clue: "not found"
}
```
*Response body if the player location does not match the clue location*

## Response Details
| Key | Value Type | Value Description |
|---|---|---|
| clue | string | Description of whether or not the clue is found. |
