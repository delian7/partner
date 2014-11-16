class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end
  def new?
    true
  end
  def show?
    true
  end
  def remove?
    true
  end
    def clear_partnerships?
    true
  end
   def leave_group?
    true
  end
  def profile?
    true
  end
  def update?
    true
  end
  def destroy?
    true
  end
  def set_current_course?
    true
  end

  def set_current_project?
    true
  end
def export_csv?
  true
end
def send_request?
  true
end
def undo_request?
  true
end
  def ignore?
    true
  end

  def confirm?
    true
  end

  def export_csv?
true
  end



end
