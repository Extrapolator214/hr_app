class SkillsController < ApplicationController

  def search
    @skills = Skill.name_starts_with(params['term'].presence).map(&:name)
    puts @skills.as_json

    respond_to do |format|
      format.json { render :json => @skills }
    end
  end
end