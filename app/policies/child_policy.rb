# frozen_string_literal: true

class ChildPolicy < ApplicationPolicy
  def show?
    admin?
  end

  def edit?
    owner_or_superadmin?
  end

  def update?
    owner_or_superadmin?
  end

  def destroy?
    owner_or_superadmin?
  end

  def join_to_event?
    owner?
  end

  def leave_event?
    owner?
  end

  def op_user?
    false
  end

  def deop_user?
    false
  end
end
