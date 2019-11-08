# frozen_string_literal: true

class VoucherPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def update?
    admin?
  end

  def import?
    admin?
  end

  def import_from_file?
    admin?
  end
end
