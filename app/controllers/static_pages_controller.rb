class StaticPagesController < ApplicationController
  def home
    @users = User.where("created_at > ?", Time.current.beginning_of_day).limit(10)
  end

  def who
  end

  def search
    @retires = []
    query = params[:name_search]
    if query && query.length >0
      Retire.joins(:user).where('lower(name) LIKE ? OR lower(last_name) LIKE ?', "%#{query}%", "%#{query}%").each { |retire| @retires << retire }
    end

    counter = 0
    Ability.all.each_with_index do |ability,i|
      aux = params[ability.name]
      if aux
        counter+=1
      end
    end

    string_by_ability = ''
    Ability.all.each_with_index do |ability,i|
      aux = params[ability.name]
      if aux
        counter -= 1
        if counter.to_i == 0
          string_by_ability += "lower(name) LIKE '#{ability.name}'"
        else
          string_by_ability += "lower(name) LIKE '#{ability.name}' OR "
        end
      end
    end
    Retire.joins(:abilities).where(string_by_ability).each { |retire| @retires << retire}

  end

  def contact
  end

end
