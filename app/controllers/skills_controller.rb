class SkillsController < InheritedResources::Base
  load_and_authorize_resource
  def index
    @skill_trees = SkillTree.all
    @tree = params[:tree].to_i
    @level = params[:level].to_i
  end
end
