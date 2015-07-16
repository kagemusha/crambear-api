class User < ActiveRecord::Base
  include TokenAuthenticatable
  rolify
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :card_sets

  def set_default_role
    self.role ||= :user
  end

  def config
    Rails.application.config_for :auth
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
