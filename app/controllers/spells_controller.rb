class SpellsController < InheritedResources::Base

  def update 
    update! { edit_spell_path(@spell) }
  end
end
