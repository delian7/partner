require 'devise/strategies/authenticatable'
  module Devise
    module Strategies

      class LocalOverride < Authenticatable

        def valid?
          true
        end

        def authenticate!

          if params['campus_id']
            user = User.find_by_campus_id(0)
            #_by_id(params['campus_id']['ucinetid'])
          if user
            success!(user)
          else
            fail
          end
        end

      end
    end
  end
end

Warden::Strategies.add(:local_override, Devise::Strategies::LocalOverride)