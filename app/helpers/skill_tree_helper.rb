module SkillTreeHelper

  def skill_tree(skill_categories, parent_skill_category_id=nil)
    current_level_skill_categories = skill_categories.select do |skill_category|
      skill_category.parent_skill_category_id == parent_skill_category_id
    end

    content_tag(:ul) do
      current_level_skill_categories.map do |skill_category|
        content_tag(:li) do
          [
            skill_tree_element_text(skill_category),
            skill_tree(skill_categories - current_level_skill_categories, skill_category.id)
          ].join.html_safe
        end
      end.join.html_safe
    end
  end

  def skill_tree_element_text(skill_category)
    content_tag(:div) do
      [
        skill_category.name,
        skill_tree_element_actions(skill_category)
      ].join.html_safe
    end
  end

  def skill_tree_element_actions(skill_category)
    content_tag(:div) do
      [
        link_to('New skill sub category', new_my_skill_category_path(parent_skill_category_id: skill_category.id), class: "button button_small"),
        link_to('Edit', edit_my_skill_category_path(skill_category), class: "button button_small"),
        link_to('Delete', my_skill_category_path(skill_category), confirm: 'Delete skill category?', method: :delete, class: "button button_small button_danger")
      ].join.html_safe
    end
  end

  def edit_skill_tree
  end

  def preview_skill_tree
  end

  def zkill_tree(skill_tree, level=0)
    content_tag(:ul) do
      skill_tree[:sub_trees].collect do |sc|
        content_tag(:li) do
          [
            sc[:category].name,
            zkill_tree_category_skills(sc[:skills]),
            zkill_tree_category_actions(sc[:category], sc[:sub_trees], sc[:skills], level),
            zkill_tree(sc, level+1)
          ].join.html_safe
        end
      end.join.html_safe
    end
  end

  def zkill_tree_category_skills(skills)
    content_tag(:ul) do
      skills.map do |skill|
        content_tag(:li) do
          [
            "#{skill.name}(#{skill.level})",
            zkill_tree_category_skill_actions(skill)
          ].join.html_safe
        end
      end.join.html_safe
    end
  end

  def zkill_tree_category_skill_actions(skill)
    [
      link_to('Edit', edit_my_skill_path(skill)),
      link_to('Delete', my_skill_path(skill), confirm: 'Delete skill?', method: :delete)
    ]
  end

  def zkill_tree_category_actions(category, sub_trees, skills, level)
    actions = []

    if level < 1 && skills.empty?
      actions << link_to('New sub category', new_my_skill_category_path(parent_skill_category_id: category.id))
    end

    if sub_trees.empty?
      actions << link_to('New skill', new_my_skill_path(skill_category_id: category.id))
    end

    actions << link_to('Edit', edit_my_skill_category_path(category))
    actions << link_to('Delete', my_skill_category_path(category), confirm: 'Delete skill category?', method: :delete)
  end

end