User.create!({
    full_name: "Lương Đức Minh",
    name: "Minh",
    email: "minh@minh.com",
    password: "password",
    password_confirmation: "password"
})

categories = ["Deserts", "Drinks", "Soup & Stew", "Salads", "Snacks", "Bread, Cakes & Muffins", "Breakfast & Brunch", "Lunch", "Dinner"]
dificulties = ["Easy", "Medium", "Hard"]

10.times do
  Recipe.create!({
      title: Faker::Food.dish,
      category: categories.sample.to_i,
      description: Faker::Lorem.sentence,
      preparation_time: rand(5),
      cooking_time: rand(10),
      ingredients: Faker::Lorem.sentence,
      instructions: Faker::Lorem.sentence,
      serving: rand(5),
      dificulty: dificulties.sample,
      vegetarian: [true, false].sample,
      image: "",
      user_id: 1
  })
end
