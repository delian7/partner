class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

def csv_import?
  true
end
def set_current_project?
  true
end
def partnerup?
  true
end
 
  def profile?
    true
  end  
   def ignore?
    true
  end  
   def show?
     true
  end  
    def remove?
    true
  end

  def update?
    true
  end
   def add_partnership?
     true
  end  
  
  def add_to_group?
    true
  end

  def update?
    true
  end

  def confirm?
    true
  end

  def destroy?
    true
  end
  
  def set_current_course?
    true
  end 
    def undo_request?
    true
  end 
  

  def clearall?
    # as long as the user is an admin or vip role , 1||2
    user.admin? || user.vip?
  end

  def cancel?
    true
  end

  def export?
    # as long as the user is an admin or vip role , 1||2
true
  end

  def clearpartnership?
    true
  end

end
