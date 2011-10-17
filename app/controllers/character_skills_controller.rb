# -*- encoding: utf-8 -*-

class CharacterSkillsController < InheritedResources::Base
  load_and_authorize_resource

  def create
    create! do |success, failure|
      success.html {
        flash[:notice] = "La till färdigheten #@character_skill till #{@character_skill.character}"
        redirect_to @character_skill.character
      }
      failure.html {
        flash[:error] = @character_skill.errors.first[1]
        redirect_to @character_skill.skill
      }
    end
  end
end
