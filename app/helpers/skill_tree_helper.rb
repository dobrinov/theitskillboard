module SkillTreeHelper

  def skill_tree(tree, editable=false, level=0)
    content_tag(:ul, class: "skill-tree skill-tree_level-#{level}") do
      contents = []

      contents << skill_tree_categories(tree[:sub_categories], editable, level)
      contents << skill_tree_skills(tree[:skills], editable)

      if editable && level == 1 && tree[:skills].empty?
        contents << new_category_element(tree[:id], level)
      end

      if editable && level >= 1 && tree[:sub_categories].empty?
        contents << new_skill_element(tree[:id])
      end

      contents.join.html_safe
    end
  end

  def skill_tree_categories(categories, editable, level)
    categories.map do |category|
      next unless editable or skills_in_tree?(category)
      content_tag(:li, class: "skill-tree__element skill-tree__element_category") do
        contents = []

        contents << skill_tree_category_name(category, editable, level)
        contents << skill_tree(category, editable, level+1)

        contents.join.html_safe
      end
    end.join.html_safe
  end

  def skill_tree_skills(skills, editable)
    skills.map do |skill|
      content_tag(:li, class: "skill-tree__element skill-tree__element_skill") do
        contents = []

        contents << skill_bar(skill.name, skill.level)
        contents << skill_tree_skill_actions(skill.id) if editable
        
        contents.join.html_safe
      end
    end.join.html_safe
  end

  def skill_tree_category_name(category, editable, level)
    content_tag("h#{level+1}", class: 'skill-tree__category-name') do
      contents = []

      contents << content_tag(:span, category[:name])
      contents << skill_tree_category_actions(category[:id]) if editable

      contents.join.html_safe
    end
  end

  def skills_in_tree?(tree)
    tree[:skills].any? || tree[:sub_categories].map { |c| skills_in_tree?(c) }.any?
  end

  def new_category_element(parent_category_id, level)
    content_tag(:li, class: "skill-tree__element skill-tree__element_new skill-tree__element_category") do
      link_to(content_tag("h#{level+1}", 'Add new category', class: 'skill-tree__category-name'), new_my_skill_category_path(parent_skill_category_id: parent_category_id), title: 'Add new category...')
    end
  end

  def new_skill_element(category_id)
    content_tag(:li, class: "skill-tree__element skill-tree__element_new skill-tree__element_skill") do
      link_to(skill_bar('Add new skill', 1), new_my_skill_path(skill_category_id: category_id), title: 'Add new skill...')
    end
  end

  def skill_tree_category_actions(category_id)
    content_tag(:div, class: 'skill-tree__element__actions') do
      [
        link_to('', edit_my_skill_category_path(category_id), title: 'Edit', class: 'skill-tree__element__action fa fa-pencil'),
        link_to('', my_skill_category_path(category_id), title: 'Delete...', data: { confirm: 'Are you sure?' }, method: :delete, class: 'skill-tree__element__action skill-tree__element__action_delete fa fa-trash-o')
      ].join.html_safe
    end
  end

  def skill_tree_skill_actions(skill_id)
    content_tag(:div, class: 'skill-tree__element__actions') do
      [
        link_to('', edit_my_skill_path(skill_id), title: 'Edit', class: 'skill-tree__element__action fa fa-pencil'),
        link_to('', my_skill_path(skill_id), title: 'Delete...', data: { confirm: 'Are you sure?' }, method: :delete, class: 'skill-tree__element__action skill-tree__element__action_delete fa fa-trash-o')
      ].join.html_safe
    end
  end

end