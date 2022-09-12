module Devise
  module Strategies
    class TokensStrategy < Devise::Strategies::Base

      def authenticate!
        return unless env['PATH_INFO'].match(/^\/api/)
        user = ::User.find_by(authentication_token: params[:auth_token])
        if user
          user.update_attribute(:authentication_token_updated_at, Time.now)
          success!(user)
        end

        if (!(params[:user]) && !halted?)
          fail!("Invalid authentication token.")
        end
      end
    end
  end
end
