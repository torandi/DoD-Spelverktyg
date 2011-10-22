# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :users, 'Användare', users_path do |sub_nav|
      sub_nav.item :new, 'Ny användare', new_user_path
    end
    primary.item :characters, "Karaktärer", characters_path do |sub_nav|
    end
    primary.item :skills, "Fördjupningar", skills_path do |sub_nav|
      SkillTree.all.each do |tree|
        sub_nav.item tree.name.downcase, tree.name, skills_path(:tree=>tree.id) do |subsub|
          (1..5).each do |level|
            subsub.item "#{tree.name.downcase}#{level}", "Nivå #{level}", skills_path(:tree=>tree.id, :level=>level) do |subsubsub|
              tree.skills.level(level).each do |skill|
                subsubsub.item skill.name.downcase, skill.name, skill_path(skill)
              end
            end
          end
        end
      end 
    end
    primary.item :spell_trees, "Vitnertavlor", spell_trees_path do |sub_nav|
      SpellTree.all.each do |tree|
        sub_nav.item tree.textid, tree.name, spell_tree_path(tree) do |subsub|
          tree.spells.all(:order=>:level).each do |spell|
            subsub.item spell.name.downcase, spell.to_s, spell_path(spell)
          end
        end
      end 
    end
    primary.item :attributes, "Attribut", attributes_path do |sub_nav|
    end
  end

end
