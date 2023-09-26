class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :whies, dependent: :destroy
  has_one_attached :profile_image

  # 検索方法分岐
  def self.looks(search, word)
    case search
    when "perfect_match"
      where("name LIKE ?", "#{word}")
    when "forward_match"
      where("name LIKE ?", "#{word}%")
    when "backward_match"
      where("name LIKE ?", "%#{word}")
    when "partial_match"
      where("name LIKE ?", "%#{word}%")
    else
      all
    end
  end

  # なんで？機能実装時に追加→RIPボタンに名称変更しています。
  def whied_by?(post_id)
    whies.where(post_id: post_id).exists?
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #ゲストログイン機能関係
  def self.create_guest_user
    unique_name = "Guest_#{SecureRandom.hex(4)}" 
    unique_email = "guest_#{SecureRandom.hex(4)}@example.com" 
    guest_user = create!(
      name: unique_name,
      email: unique_email, 
      password: Devise.friendly_token[0, 20] 
    )
  end
end
