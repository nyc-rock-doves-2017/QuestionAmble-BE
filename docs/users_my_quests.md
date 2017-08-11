# Users - My Quests

## Endpoint
`GET https://questionamble.herokuapp.com/users/{id}/my_quests`

## Request Example
```
GET https://questionamble.herokuapp.com/users/1/my_quests
```

## Response
On success, the HTTP status code in the response header is 200 OK and the response body contains a collection of quest objects and their questions in JSON format.

## Example
```
[
  {
    id: 3,
    title: "The 'Friends' Quest",
    gameKey: "S35L93NU",
    description: "How You Doin'",
    questCreator: "kelsey",
    timesPlayed: 1,
    timesCompleted: 0,
    completionScore: "0%",
    avgAccuracyScore: "---",
    playedBy: [
      "wan"
    ],
    questions: [
      {
        id: 8,
        questId: 3,
        questionText: "What is Rachel's last name?",
        answer: "Green",
        hint: "The G in Roy G Biv",
        clueType: "text",
        clueText: "A full-stack web development bootcamp in the Financial District",
        lat: "40.706434",
        lng: "-74.009133"
      },
      {
        id: 9,
        questId: 3,
        questionText: "Whose go to line is "How you doin?"",
        answer: "Joey",
        hint: "Not Ross, not Chandler",
        clueType: "text",
        clueText: "Experience the history of money and finance here...",
        lat: "40.706434",
        lng: "-74.009133"
      },
      {
        id: 10,
        questId: 3,
        questionText: "What instrument does Phoebe play?",
        answer: "Guitar",
        hint: "It has 6 strings",
        clueType: "text",
        clueText: "The world's largest stock exchange...",
        lat: "40.706434",
        lng: "-74.009133"
      },
      {
        id: 11,
        questId: 3,
        questionText: "Which 'Friends' character is a chef?",
        answer: "Monica",
        hint: "Ross' sister",
        clueType: "text",
        clueText: "This building served as the first U.S. Capitol building",
        lat: "40.706434",
        lng: "-74.009133"
      }
    ]
  }
]
```

## Response Details
| Key | Value Type | Value Description |
|---|---|---|
| id | integer | The record id for the users quest object. |
| title | string | The title that quest. |
| gameKey | string | The quest code needed to access that quest. |
| description | string | The description of that quest. |
| questCreator | string | The username of the user that created the quest. |
| timesPlayed | integer | The number of times players have started that quest. |
| timesCompleted | integer | The number of times players have answered all questions in that quest. |
| completionScore | string | The percentage representing the average completion score of that quest. |
| avgAccuracyScore | string | The percentage representing the average accuracy score of that quest. |
| playedBy | array of strings | The usernames of all the users who have taken that quest. |
| questions | array of question objects | The question objects for all questions in that quest. |
