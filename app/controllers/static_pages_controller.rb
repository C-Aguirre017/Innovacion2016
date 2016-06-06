class StaticPagesController < ApplicationController
  def home
    @users = User.where("created_at > ?", Time.current.beginning_of_day).limit(10)
  end

  def who
  end

  def search
    @users = User.limit(10)
  end

  def contact
  end

end
