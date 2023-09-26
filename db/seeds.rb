# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)






james = EndUser.find_or_create_by!(email: "james@example.com") do |end_user|
  end_user.name = "James"
  end_user.password = "password"
  end_user.is_deleted = false
  end_user.profile_image = ActiveStorage::Blob.create_and_upload!(
  io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"),
  filename: "sample-user2.jpg"
)
end





Post.find_or_create_by!(name: "ノーコピーライトガール１") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.caption = 'nocopyright'
  post.end_user = james
end
Post.find_or_create_by!(name: "ノーコピーライトガール2") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.caption = 'nocopyright'
  post.end_user = james
end
Post.find_or_create_by!(name: "ノーコピーライトガール3") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.caption = 'nocopyright'
  post.end_user = james
end
Post.find_or_create_by!(name: "ノーコピーライトガール4") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  post.caption = 'nocopyright'
  post.end_user = james
end
Post.find_or_create_by!(name: "ノーコピーライトガール5") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  post.caption = 'nocopyright'
  post.end_user = james
end