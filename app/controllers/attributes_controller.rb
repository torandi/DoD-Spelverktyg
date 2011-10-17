class AttributesController < InheritedResources::Base
  def create
    create! { new_attribute_path }
  end
end
