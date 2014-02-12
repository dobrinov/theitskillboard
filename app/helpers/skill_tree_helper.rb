module SkillTreeHelper

  def skill_tree(skill_tree, level=0)
    content_tag(:ul, class: "skill-tree skill-tree_level-#{level} row") do
      contents = []
      contents << skill_tree_categories_list(skill_tree[:sub_categories], level)
      contents << skill_tree_skills_list(skill_tree[:skills])

      if (level == 1) && skill_tree[:skills].empty?
        contents << content_tag(:li, link_to('New category', new_my_skill_category_path(parent_skill_category_id: skill_tree[:id])), class: "skill-tree__element skill-tree__element_new")
      end

      if (level != 0) && skill_tree[:sub_categories].empty?
        contents << content_tag(:li, link_to('New skill', new_my_skill_path(skill_category_id: skill_tree[:id])), class: "skill-tree__element skill-tree__element_new")
      end

      contents.join.html_safe
    end
  end

  def skill_tree_categories_list(categories, level)
    categories.map do |category|
      content_tag(:li) do
        [
          skill_tree_category_name(category, level),
          skill_tree(category, level+1)
        ].join.html_safe
      end
    end.join.html_safe
  end

  def skill_tree_category_name(category, level)
    content_tag(:div) do
      contents = []

      contents << content_tag("h#{level+1}", category[:name], class: "skill-tree__category-name")
      contents << skill_tree_category_actions(category)

      contents.join.html_safe
    end
  end

  def skill_tree_category_actions(category)
    [
      link_to('Edit', edit_my_skill_category_path(category[:id])),
      link_to('Delete', my_skill_category_path(category[:id]), data: { confirm: 'Delete skill category?' }, method: :delete)
    ].join.html_safe
  end

  def skill_tree_skills_list(skills)
    skills.map do |skill|
      content_tag(:li, class: 'skill-tree__element skill-tree__skill') do
        contents = []

        contents << skill_bar(skill.name, skill.level)
        contents << skill_tree_skill_actions(skill)

        contents.join.html_safe
      end
    end.join.html_safe
  end

  def skill_tree_skill_actions(skill)
    [
      link_to('Edit', edit_my_skill_path(skill)),
      link_to('Delete', my_skill_path(skill), data: { confirm: 'Delete skill?' }, method: :delete)
    ].join.html_safe
  end

end