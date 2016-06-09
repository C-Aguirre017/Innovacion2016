class StaticPagesController < ApplicationController
  def home
    @users = User.where("created_at > ?", Time.current.beginning_of_day).limit(10)
  end

  def who
  end

  def search
    @users = User.limit(10)
  end

  def search_by_name
    query = params[:query]
    @retires = Retire.joins(:user).where('lower(name) LIKE ? OR lower(last_name) LIKE ?', "%#{query}%", "%#{query}%")

    render search
  end

  def search_by_hability
    aux_string = ''
    Ability.each { aux_string += ' lower(name) LIKE ? OR'}

    @retires = Retire.joins(:abilities).where('', "%#{query}%", "%#{query}%")

  end

  def contact
  end

end
