class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books
  has_many :book_comments
  has_many :favorites
  attachment :profile_image, destroy: false
  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true,length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50 }
end
