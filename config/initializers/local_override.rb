require 'devise/strategies/authenticatable'
  module Devise
    module Strategies

      class LocalOverride < Authenticatable

        def valid?
          true
        end

        def authenticate!

          if params[:user]
          user = User.find_by_id(0)
 
          if user
            success!(user)
          else
            fail
          end 
        else
          fail
        end 

      end
    end
  end
end

Warden::Strategies.add(:local_override, Devise::Strategies::LocalOverride)