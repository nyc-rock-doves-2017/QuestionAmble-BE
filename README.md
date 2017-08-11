# QuestionAmble (Back End)

QuestionAmble is a React Native mobile application that allows users to create and play quests with location-based questions. Players who embark on a quest need to locate where each question is based and, once found, try to guess the answer. The game is over when the player has correctly answered all the questions for the quest. When this happens, the player is shown their results. The focus of this app is knowledge by exploring the physical world!

This is the back end component of our project. Although we had one week to design and program the initial version that was demoed, there may be updates from time to time. This is not a commercial application.

Information regarding the QuestionAmble Front End, including a live demo, can be found [here](https://github.com/nyc-rock-doves-2017/QuestionAmbleFE).

### Table of Contents
* [Team Members](###team-members)
* [Structure](###structure)
* [Resources](###resources)

### Team Members
* [Wan Tsui](https://github.com/wantsui)
* [Kelsey Malone](https://github.com/kqm001)
* [Kevin Cross](https://github.com/Kevinhcross96)
* [Rahat Alam](https://github.com/rahat64)

### Structure
The backend of QuestionAmble is built as an Ruby on Rails API calling on data stored in a PostgreSQL database hosted on Heroku.  Our API returns data in JSON format.

#### Database
![QuestionAmble Schema Design](readme-assets/questionamble_schema.png)

*Figure 1*.  Simplified schema design for QuestionAmble database.

#### API Endpoint Reference
| Method | Endpoint | Returns |
|---|---|---|
| GET | [/rounds?id={id}](docs/round_show.md) | Get data about a round of play. |
| GET | [/rounds/{id}/next_question](docs/round_next_question.md) | Get data about a round of play. |
| GET | [/rounds/{id}/compare_location?player_lat={lat}&player_lng={lng}&cur_question_id={currentQuestionId}](docs/round_compare_location.md) | Get response regarding if the players current location is a match for the clue location. |
| GET | [/users/{id}/my_quests](docs/users_my_quests.md) | Get data on all of the quests created by that user. |
| GET | [/users/{id}/my_stats](docs/round_compare_location.md) | Get data on all of the quests played by that user. |
| POST| /rounds| Create a new round by playing a quest. |
| POST| /results| Create a new result by answering a quest question. |
| POST| /questions| Create a new quest question. |
| POST| /quests| Create a new quest. |
| POST| /users| Create a new user. |

##### Example API Endpoint Details
Below is the full API endpoint details for one endpoint in QuestionAmble.  Full API endpoint details can be accessed using the links in the table above.

###### Endpoint
`GET https://questionamble.herokuapp.com/rounds/{id}`

###### Request Example
```
GET https://questionamble.herokuapp.com/rounds/6/compare_location?player_lat=40.709609&player_lng=-74.012167&cur_question_id=20
```

###### Response
On success, the HTTP status code in the response header is 200 OK and the response body contains an a round object in JSON format.

###### Example
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
###### Response Details
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

### Resources
Gems utilized in this project include:
* [JWT](https://github.com/jwt/ruby-jwt/)
* [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers/)
* [Geokit Rails](https://github.com/geokit/geokit-rails/)
