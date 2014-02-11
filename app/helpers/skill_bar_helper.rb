module SkillBarHelper

  def skill_bar(name, level)
    content_tag(:div, class: "skill-bar skill-bar_#{level}") do
      [
        content_tag(:div, name, class: "skill-bar__name"),
        content_tag(:div, nil, class: "skill-bar__level")
      ].join.html_safe
    end
  end

  def skill_bar_slider(form)
    form.number_field(:level, placeholder: 'Level of experience', class: 'input_block', in: (0..10))
  end

end