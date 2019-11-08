# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def new?
    superadmin?
  end

  def show?
    owner_or_superadmin?
  end

  def destroy?
    owner_or_superadmin?
  end

  def join_to_event?
    owner?
  end
end
