require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "valid user" do
    assert @user.valid?, 'The default fixture should define a valid user'
  end

  test "user employments" do
    employments = @user.employments

    assert employments.is_a?(Array)

    employments.each do |employment|
      assert employment.kind_of?(Employment)
      assert employment.profile == @user.profile
    end

    assert employments.count == Employment.joins(:profile).where(profile_id: @user.profile.id).count
  end

  test "user companies" do
    companies = @user.companies

    assert companies.is_a?(Array)

    companies.each do |company|
      assert company.kind_of?(Company)
    end
  end

  test "user impacts" do
    impacts = @user.impacts

    assert impacts.is_a?(Array)

    impacts.each do |impact|
      assert impact.kind_of?(Impact)
    end

    impacts_count = [
      Impact.joins(:employment).where(employments: {profile_id: User.first.profile.id}).count,
      Impact.joins(project: [company: :employments]).where(employments: {profile_id: User.first.profile.id}).count
    ].inject{ |sum,x| sum + x }

    assert impacts_count == impacts.count
  end

  test "user projects" do
    projects = @user.projects

    assert projects.is_a?(Array)

    projects.each do |project|
      assert project.kind_of?(Project)
    end
  end

  test "user universities" do
    pending
  end

  test "user studies" do
    pending
  end

  test "user skills" do
    pending
    #  Skill.joins(impacts: :employment).where(employments: {profile_id: x.profile.id})
    #  Skill.joins(impacts: [project: [company: :employments]]).where(employments: {profile_id: x.profile.id})
  end

end