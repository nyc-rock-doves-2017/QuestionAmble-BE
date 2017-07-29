User.delete_all
Quest.delete_all
Question.delete_all
Round.delete_all
Result.delete_all

5.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password')
end

User.all.ids.each do |id|
  Quest.create(creator_id: id, title: ("Title: " + Faker::Book.title), description: ("Desc: " + Faker::Hipster.sentence(3)))
end

Quest.all.ids.each do |id|
  3.times do
    Question.create(quest_id: id, question_text: ("q_text: " + Faker::Hipster.sentence(3)), answer: ("answer: " + Faker::Food.ingredient), hint: ("hint: " + Faker::Food.measurement), clue_type: "text", clue_text: ("clue: " + Faker::Food.spice))
  end
end

Round.create(quest_id: 2, player_id: 1)
  Result.create (round_id: 1, question_id: 4, win: true)
  Result.create (round_id: 1, question_id: 5, win: false)
  Result.create (round_id: 1, question_id: 5, win: false)
  Result.create (round_id: 1, question_id: 5, win: true)
  Result.create (round_id: 1, question_id: 6, win: true)

Round.create(quest_id: 3, player_id: 2)
  Result.create(round_id: 2, question_id: 7, win: false)
  Result.create(round_id: 2, question_id: 7, win: true)
  Result.create(round_id: 2, question_id: 8, win: true)
  Result.create(round_id: 2, question_id: 9, win: true)

Round.create(quest_id: 4, player_id: 3)
  Result.create(round_id: 3, question_id: 10, win: true)
  Result.create(round_id: 3, question_id: 11, win: true)
  Result.create(round_id: 3, question_id: 12, win: true)

Round.create(quest_id: 5, player_id: 4)
  Result.create(round_id: 4, question_id: 13, win: true)
  Result.create(round_id: 4, question_id: 14, win: false)
  Result.create(round_id: 4, question_id: 15, win: false)
  Result.create(round_id: 4, question_id: 15, win: false)
  Result.create(round_id: 4, question_id: 15, win: false)
  Result.create(round_id: 4, question_id: 15, win: false)
  Result.create(round_id: 4, question_id: 15, win: true)

Round.create(quest_id: 1, player_id: 5)
  Result.create(round_id: 5, question_id: 1, win: true)
  Result.create(round_id: 5, question_id: 2, win: true)
  Result.create(round_id: 5, question_id: 3, win: true)

Round.create(quest_id: 1, player_id: 3)
  Result.create(round_id: 6, question_id: 1, win: true)
  Result.create(round_id: 6, question_id: 2, win: false)
  Result.create(round_id: 6, question_id: 2, win: false)
  Result.create(round_id: 6, question_id: 2, win: true)
  Result.create(round_id: 6, question_id: 3, win: true)

Round.create(quest_id: 1, player_id: 4)
  Result.create(round_id: 7, question_id: 1, win: true)
  Result.create(round_id: 7, question_id: 2, win: true)
  Result.create(round_id: 7, question_id: 3, win: false)
  Result.create(round_id: 7, question_id: 3, win: true)

Round.create(quest_id: 2, player_id: 3)
  Result.create (round_id: 8, question_id: 4, win: true)
  Result.create (round_id: 8, question_id: 5, win: true)
  Result.create (round_id: 8, question_id: 6, win: true)

Round.create(quest_id: 3, player_id: 5)
  Result.create(round_id: 9, question_id: 7, win: false)
  Result.create(round_id: 9, question_id: 7, win: true)
  Result.create(round_id: 9, question_id: 8, win: false)
  Result.create(round_id: 9, question_id: 8, win: true)
  Result.create(round_id: 9, question_id: 9, win: false)
  Result.create(round_id: 9, question_id: 9, win: true)

Round.create(quest_id: 4, player_id: 1)
  Result.create(round_id: 10, question_id: 10, win: true)
  Result.create(round_id: 10, question_id: 11, win: true)
  Result.create(round_id: 10, question_id: 12, win: true)
