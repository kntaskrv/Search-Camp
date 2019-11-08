# frozen_string_literal: true

class AdultPolicy < ApplicationPolicy
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
    superadmin?
  end

  def deop_user?
    superadmin?
  end

  def kick_user?
    owner_or_superadmin?
  end
end
