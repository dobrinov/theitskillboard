class ProfilesController < ApplicationController

  def show
    if params[:id] == 'demo'
      @user = demo_user
    else
      @user = User.find(params[:id])
    end

    @skill_tree = build_skill_tree(@user.skill_categories, @user.skills.order(level: :desc))
  end

  private

  def demo_user
    user = User.new(
      {
        name: 'Demo',
        surname: 'Guy',
        definition: 'software developer',
        birth_date: Time.now - 26.years,
        gender: 'm',
        country: 'Germany',
        city: 'Munich',
        nationality: 'German'
      }
    )

    user.interests << Interest.new({name: 'Programming'})
    user.interests << Interest.new({name: 'Presentations'})

    user.contacts << Contact.new({ctype: :email, address: 'demo@example.com'})

    user
  end

end