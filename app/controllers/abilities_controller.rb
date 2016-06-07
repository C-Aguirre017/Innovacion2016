class AbilitiesController < ApplicationController
  def index
    @abilities = Ability.all
  end

  def get_ability

    if current_user.retire?
      current_user.retire.abilities.clear

      Ability.all.each do |ability|
        name = "ability_#{ability.id}"
        if params[name]
          Cv.create!(
            retire_id: current_user.retire.id,
            ability_id: ability.id
          )
        end
      end
    end

    redirect_to current_user
  end
end
