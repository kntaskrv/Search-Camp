# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :birthday, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :validatable, :invitable # , :omniauthable

  enum role: { user: 0, admin: 1, superadmin: 2 }

  has_one :profile, dependent: :destroy

  has_many :members, dependent: :destroy, inverse_of: :user
  has_many :events, through: :members
  has_many :staff_requests, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_commit :set_type, on: :create
  after_commit :set_profile, on: :create

  scope :by_type, ->(type) { where(type: type) if type.present? }

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day) ? 0 : 1)
  end

  private

  def set_type
    self.type = (age < 18 ? 'Child' : 'Adult')

    save
  end

  def set_profile
    Profile.create(user: self)
  end
end
