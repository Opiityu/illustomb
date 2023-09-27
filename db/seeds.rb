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




#end_userのテストデータ

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


mike = EndUser.find_or_create_by!(email: "mike@example.com") do |end_user|
  end_user.name = "mike"
  end_user.password = "password"
  end_user.is_deleted = false
  end_user.profile_image = ActiveStorage::Blob.create_and_upload!(
  io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"),
  filename: "sample-user1.jpg"
)
end

Post.find_or_create_by!(name: "rekisi1") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rekisi1.jpg"), filename:"rekisi1.jpg")
  post.caption = '歴史の人物です'
  post.end_user = mike
end
Post.find_or_create_by!(name: "rekisi2") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rekisi2.jpg"), filename:"rekisi2.jpg")
  post.caption = '歴史の人物です'
  post.end_user = mike
end
Post.find_or_create_by!(name: "rekisi3") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rekisi3.jpg"), filename:"rekisi3.jpg")
  post.caption = '歴史の人物です'
  post.end_user = mike
end
Post.find_or_create_by!(name: "rekisi4") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rekisi4.jpg"), filename:"rekisi4.jpg")
  post.caption = '歴史の人物です'
  post.end_user = mike
end
Post.find_or_create_by!(name: "rekisi5") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rekisi5.jpg"), filename:"rekisi5.jpg")
  post.caption = '歴史の人物です'
  post.end_user = mike
end



eve = EndUser.find_or_create_by!(email: "eve@example.com") do |end_user|
  end_user.name = "eve"
  end_user.password = "password"
  end_user.is_deleted = false
  end_user.profile_image = ActiveStorage::Blob.create_and_upload!(
  io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"),
  filename: "sample-user3.jpg"
)
end

(1..5).each do |i|
  name = "kaiga#{i}"
  Post.find_or_create_by!(name: name) do |post|
    post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/#{name}.jpg"), filename: "#{name}.jpg")
    post.caption = '絵画です'
    post.end_user = eve
  end
end





ai = EndUser.find_or_create_by!(email: "ai@example.com") do |end_user|
  end_user.name = "ai"
  end_user.password = "password"
  end_user.is_deleted = false
  end_user.profile_image = ActiveStorage::Blob.create_and_upload!(
  io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"),
  filename: "sample-user4.jpg"
)
end

(1..5).each do |i|
  name = "AI#{i}"
  Post.find_or_create_by!(name: name) do |post|
    post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/#{name}.jpg"), filename: "#{name}.jpg")
    post.caption = 'AI生成です'
    post.end_user = ai
  end
end
