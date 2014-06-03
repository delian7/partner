class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def flop?
    true
  end
  def clearall?
    @user.admin?
  end
  def export?
    @user.admin?
  end

end
