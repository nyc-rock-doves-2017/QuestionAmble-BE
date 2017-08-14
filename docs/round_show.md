# Round - Show

## Endpoint
`GET https://questionamble.herokuapp.com/rounds/{id}`

## Request Example
```
GET https://questionamble.herokuapp.com/rounds/6
```

## Response
On success, the HTTP status code in the response header is 200 OK and the response body contains an a round object in JSON format.

## Example
```
{
  id: 1,
  createdBy: "wan",
  questTitle: "NAME... THAT... LANGUAGE",
  playedBy: "wan",
  completionScore: "100%",
  accuracyScore: "100%",
  dateOfPlay: "August 03, 2017",
  firstQuestion: {
    id: 1,
    quest_id: 1,
    question_text: "The slogan of this language is "Write once, run anywhere"",
    answer: "Java",
    hint: "You might need it to wake up in the morning",
    clue_type: "text",
    clue_text: "A full-stack web-development bootcamp in the Financial District",
    created_at: "2017-08-03T23:57:43.269Z",
    updated_at: "2017-08-03T23:57:43.269Z",
    clue_image_file_name: null,
    clue_image_content_type: null,
    clue_image_file_size: null,
    clue_image_updated_at: null,
    lat: "40.706262",
    lng: "-74.009093"
  },
  player: {
    id: 2,
    email: "wan@questionamble.com",
    username: "wan",
    indAverageScore: "100%",
    numGamesCompleted: 1,
    numGamesStarted: 2,
    completenessPercentage: "50%"
  }
}
```

## Response Details
| Key | Value Type | Value Description |
|---|---|---|
| id | integer | The record id for the round object. |
| createdBy | string | The username of the user who created the quest that is being played in that round. |
| questTitle | string | The title the quest that is being played in that round. |
| playedBy | string | The username of the user playing the quest in that round. |
| completionScore | string | The percentage representing how many questions the player completed in that round. |
| accuracyScore | string | The percentage representing how many questions the player answered correctly on the first try. |
| dateOfPlay | string | The date the quest being played in that round was started. |
| firstQuestion | question object | A question object for the first question in the quest being played in that round. |
| player | user object | A user object for the user playing the quest in that round. |
