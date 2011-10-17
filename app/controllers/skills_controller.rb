class SkillsController < InheritedResources::Base
  load_and_authorize_resource
  def index
    @skill_trees = SkillTree.all
  end
end
