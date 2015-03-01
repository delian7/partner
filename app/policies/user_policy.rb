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
  def request_join?
    true
  end  
  def set_user_current_course?
    true
  end
  def show?
    true
  end
  def remove?
    true
  end
  def disband?
    true
  end
  def clear_partnerships?
    user.role !=0
  end
  def leave?
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
  def export_groups?
    user.role !=0
  end
  def export_ungrouped?
    user.role !=0
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
  def csv_import?
    user.role !=0
  end
  
end
