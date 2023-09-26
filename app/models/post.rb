class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
  has_many :whies, dependent: :destroy

#Whenever実装時に追加
 def old?
    threshold = 30.days
    created_at <= threshold.ago
 end


 def self.delete_oldest_post
    oldest_post = Post.where('created_at <= ?', 30.days.ago).order(created_at: :asc).first

    if oldest_post
      oldest_post.destroy
      Rails.logger.info("Deleted post with ID #{oldest_post.id}")
    else
      Rails.logger.info("No old posts to delete")
    end
 end
 
 def self.forward_match(word)
    where("name LIKE ?", "#{word}%")
 end


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
