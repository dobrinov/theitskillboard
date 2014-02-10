module SkillTreeHelper

  def skill_tree(skill_categories, parent_skill_category_id=nil)
    current_level_skill_categories = skill_categories.select do |skill_category|
      skill_category.parent_skill_category_id == parent_skill_category_id
    end

    content_tag(:ul, class: 'skill-tree') do
      current_level_skill_categories.map do |skill_category|
        content_tag(:li, class: 'skill-tree__element') do
          [
            skill_tree_element_text(skill_category),
            skill_tree(skill_categories - current_level_skill_categories, skill_category.id)
          ].join.html_safe
        end
      end.join.html_safe
    end
  end

  def skill_tree_element_text(skill_category)
    content_tag(:div, class: "skill-tree__element__text") do
      [
        skill_category.name,
        skill_tree_element_actions(skill_category)
      ].join.html_safe
    end
  end

  def skill_tree_element_actions(skill_category)
    content_tag(:div, class: "skill-tree__element__actions") do
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

end