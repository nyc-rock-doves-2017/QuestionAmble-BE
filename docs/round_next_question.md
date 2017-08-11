# Round - Next Question

## Endpoint
`GET https://questionamble.herokuapp.com/rounds/{id}/next_question`

## Request Example
```
GET https://questionamble.herokuapp.com/rounds/6/next_question
```

## Response
On success, the HTTP status code in the response header is 200 OK and the response body contains an a question object in JSON format if the player is not on the last question, otherwise a game complete  message is returned.

## Example
```
{
  message: "game complete"
}
```
*Response body if there are no more questions remaining in the quest*
```
{
  id: 20,
  questId: 4,
  questionText: "What borough would be the 3rd largest city in the us if it were its own city",
  answer: "Brooklyn ",
  hint: "Home of the Nets...",
  clueType: "text",
  clueText: "Coding bootcamp in the Financial District",
  lat: "40.709609",
  lng: "-74.012167"
}
```
*Response body if there are questions remaining in the quest*

## Response Details
| Key | Value Type | Value Description |
|---|---|---|
| id | integer | The record id for the question object of the next question in play. |
| questId | integer | The record id for the quest to which the next question in play belongs. |
| questionText | string | The question text for the next question in play. |
| answer | string | The answer text for the next question in play. |
| hint | string | The hint text for the next question in play. |
| clueType | string | This data is not currently being used, reserved for potential future enhancements. |
| clueText | string | The text that describes the location where the player can access the question.|
| lat | integer | The latitude of the question location. |
| lng | integer | The longitude of the question location. |
