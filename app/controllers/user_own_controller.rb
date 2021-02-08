class UserOwnController < ApplicationController
    def json_url
        @users = User.all
        render json: @users.map { |user|
            user.as_json.merge({ password: user.encrypted_password })
        }
    end
end
