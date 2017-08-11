# Users - My Stats

## Endpoint
`GET https://questionamble.herokuapp.com/users/{id}/my_stats`

## Request Example
```
GET https://questionamble.herokuapp.com/users/1/my_stats
```

## Response
On success, the HTTP status code in the response header is 200 OK and the response body contains information about a user, their created quests, and the quests they have played, in JSON format.

## Example
```
{
  id: 1,
  email: "kelsey@questionamble.com",
  username: "kelsey",
  indAverageScore: "83%",
  numGamesCompleted: 6,
  numGamesStarted: 7,
  completenessPercentage: "85%",
  questsCreated: [
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
        ]
    },
  ],
  gamesPlayed: [
    {
      id: 2,
      createdBy: "rahat",
      questTitle: "American History",
      playedBy: "kelsey",
      completionScore: "100%",
      accuracyScore: "100%",
      dateOfPlay: "August 04, 2017",
      firstQuestion: {
        id: 16,
        quest_id: 5,
        question_text: "What was the first state?",
        answer: "Delaware",
        hint: "The capital city is Dover.",
        clue_type: "text",
        clue_text: "A full-stack web development in the Financial District",
        created_at: "2017-08-04T00:55:30.342Z",
        updated_at: "2017-08-04T00:55:30.342Z",
        clue_image_file_name: null,
        clue_image_content_type: null,
        clue_image_file_size: null,
        clue_image_updated_at: null,
        lat: "40.706434",
        lng: "-74.009133"
      }
    }
  ]
}
```

## Response Details
| Key | Value Type | Value Description |
|---|---|---|
| id | integer | The record id for the user record. |
| email | string | The email associated with that user account. |
| username | string | The username associated with that user account. |
| indAverageScore | string | The percentage representing the average accuracy score of all the quests played by that user. |
| numGamesCompleted | integer | The number of quests the user has completed playing by answering all questions in the quest correctly. |
| numGamesStarted | integer | The number of quests the user has started playing. |
| completenessPercentage | string | The percentage representing the average completion score of all of the quests the user has started. |
| questsCreated | array of quest objects | Data for all the quests that the user has created. |
| gamesPlayed | array of round objects | Data for all the rounds that the user has played. |
