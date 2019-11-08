# frozen_string_literal: true

class SeasonPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin?
  end

  def new?
    admin?
  end

  def create?
    admin?
  end

  def edit?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def events?
    admin?
  end

  def event_list?
    admin?
  end

  def add_event?
    admin?
  end

  def delete_event?
    admin?
  end

  def staff?
    admin?
  end

  def adult_list?
    admin?
  end

  def invite_employee?
    admin?
  end

  def add_employee?
    admin?
  end

  def delete_employee?
    admin?
  end

  def open_chat?
    admin?
  end

  def close_chat?
    admin?
  end

  def start_season?
    admin?
  end
end
