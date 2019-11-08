# frozen_string_literal: true

class StaffRequestPolicy < ApplicationPolicy
  def destroy?
    admin? || owner_request?
  end

  def accept?
    owner_request?
  end

  private

  def owner_request?
    @record.user.id == @user.id
  end
end
