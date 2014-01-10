# user
User.destroy_all
first_user = User.create!(email: "noah@porteschaikin.com", username: "nporteschaikin", password: "test000", password_confirmation: "test000")
second_user = User.create!(email: "austria@porteschaikin.com", username: "aporteschaikin", password: "test000", password_confirmation: "test000")

# areas
Area.destroy_all
Place.destroy_all
williamsburg_area = first_user.areas.create!(place: Place.find_or_create("109 North 5th St, Brooklyn, NY 11249"), radius: 50, label: "Home")
east_village_area = first_user.areas.create!(place: Place.find_or_create("35 Great Jones St., New York, NY 10012"), radius: 1, label: "Work")
westchester_area = second_user.areas.create!(place: Place.find_or_create("21 Elena Drive, Cortlandt Manor, NY 10567"), radius: 20, label: "Husband")
norwalk_area = second_user.areas.create!(place: Place.find_or_create("Norwalk, CT"), radius: 20, label: "Home")

# posts 
lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut bibendum odio. Donec nibh tortor, auctor sed suscipit vitae, bibendum a turpis."
Post.destroy_all
first_post = Post.create!(message: lorem_ipsum, user: second_user, place: Place.find_or_create("179 Bedford Ave, Brooklyn, NY 11211"))
second_post = Post.create!(message: lorem_ipsum, user: first_user, place: Place.find_or_create("359 Bowery, New York, NY 10003"))
third_post = Post.create!(message: lorem_ipsum, user: first_user, place: Place.find_or_create("100 Greyrock Pl, Stamford, CT"))

# likes
Like.destroy_all
first_post.like! first_user
first_post.like! second_user
second_post.like! second_user
third_post.like! second_user

# comments
Comment.destroy_all
first_post.comments.create!(user: first_user, message: lorem_ipsum)
second_post.comments.create!(user: second_user, message: lorem_ipsum)
third_post.comments.create!(user: first_user, message: lorem_ipsum)

# avatars
sample_path = File.join(Rails.root, "public", "seeds")
first_user.build_avatar(attachment: File.open(File.join(sample_path, "first_user_avatar.jpg")))
first_user.save!
second_user.build_avatar(attachment: File.open(File.join(sample_path, "second_user_avatar.jpg")))
second_user.save!