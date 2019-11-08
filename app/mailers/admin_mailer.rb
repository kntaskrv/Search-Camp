class AdminMailer < ApplicationMailer
  def example(user, groups, season)
    @season = season
    @user = user
    @groups = load_children(groups)
    mail(to: @user.email, subject: 'Test Email for Letter Opener')
  end

  private

  def load_children(groups)
    children = []
    groups.each do |group|
      children << Child.where(id: group)
    end
    children
  end
end
