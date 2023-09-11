class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :whies, dependent: :destroy


  ###なんで？機能実装時に追加
  def whied_by?(post_id)
    whies.where(post_id: post_id).exists?
  end


end
