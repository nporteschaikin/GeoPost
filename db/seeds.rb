Asset.destroy_all
Like.destroy_all
Area.destroy_all
Place.destroy_all
Category.destroy_all
User.destroy_all
Post.destroy_all
Comment.destroy_all

# user
first_user = User.create!(email: "noah@porteschaikin.com", username: "nporteschaikin", password: "test000", password_confirmation: "test000")
second_user = User.create!(email: "austria@porteschaikin.com", username: "aporteschaikin", password: "test000", password_confirmation: "test000")

# areas
williamsburg_area = first_user.areas.create!(place: Place.find_or_create("109 North 5th St, Brooklyn, NY 11249"), radius: 0.5, label: "Home")
east_village_area = first_user.areas.create!(place: Place.find_or_create("35 Great Jones St., New York, NY 10012"), radius: 1, label: "Work")
westchester_area = first_user.areas.create!(place: Place.find_or_create("21 Elena Drive, Cortlandt Manor, NY 10567"), radius: 20, label: "Dad")
norwalk_area = first_user.areas.create!(place: Place.find_or_create("Norwalk, CT"), radius: 20, label: "Mom")

# categories
first_category = Category.create!(name: "For Sale", slug: "for-sale")
second_category = Category.create!(name: "Events", slug: "events")

# posts
lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut bibendum odio. Donec nibh tortor, auctor sed suscipit vitae, bibendum a turpis."
lorem_ipsum_title = "Lorem ipsum dolor sit amet"
first_post = Post.create!(title: lorem_ipsum_title, body: lorem_ipsum, user: second_user, place: Place.find_or_create("179 Bedford Ave, Brooklyn, NY 11211"), category: first_category)
second_post = Post.create!(title: lorem_ipsum_title, body: lorem_ipsum, user: first_user, place: Place.find_or_create("359 Bowery, New York, NY 10003"), category: first_category)
third_post = Post.create!(title: lorem_ipsum_title, body: lorem_ipsum, user: first_user, place: Place.find_or_create("100 Greyrock Pl, Stamford, CT"), category: first_category)
fourth_post = Post.create!(title: lorem_ipsum_title, body: lorem_ipsum, user: second_user, place: Place.find_or_create("100 Greyrock Pl, Stamford, CT"), category: second_category)
fifth_post = Post.create!(title: lorem_ipsum_title, body: lorem_ipsum, user: first_user, place: Place.find_or_create("100 Greyrock Pl, Stamford, CT"), category: second_category)
sixth_post = Post.create!(title: lorem_ipsum_title, body: lorem_ipsum, user: second_user, place: Place.find_or_create("100 Greyrock Pl, Stamford, CT"), category: second_category)

# likes
first_post.like! first_user
first_post.like! second_user
second_post.like! second_user
third_post.like! second_user

# comments
first_post.comments.create!(user: first_user, message: lorem_ipsum)
second_post.comments.create!(user: second_user, message: lorem_ipsum)
third_post.comments.create!(user: first_user, message: lorem_ipsum)

# tags
first_post.tag! ["for sale", "computer"]
fifth_post.tag! ["for sale", "computer", "laptop"]
fourth_post.tag! ["chicken", "computer"]
fifth_post.tag! ["fnoah", "ethan"]

# avatars
sample_path = File.join(Rails.root, "public", "seeds")
first_user.build_avatar(attachment: File.open(File.join(sample_path, "first_user_avatar.jpg")))
first_user.save!
second_user.build_avatar(attachment: File.open(File.join(sample_path, "second_user_avatar.jpg")))
second_user.save!
