# frozen_string_literal: true

class ContractPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def create?
    admin?
  end

  def destroy?
    admin?
  end

  def delete_employee?
    admin?
  end
end
