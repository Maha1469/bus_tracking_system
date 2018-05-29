class Api::V1::RegistrationsController < ApplicationController
   def create
     begin
       if params[:password] == params[:password_confirmation]
          @user = User.new
          @user.email = params[:email]
          @user.password = params[:password]
          @user.password_confirmation = params[:password_confirmation]
          @user.role = 2
          if @user.save
            @std = Student.new
            @std.name = params[:name]
            @std.roll_number = params[:roll_number]
            @std.batch_number = params[:batch_number]
            @std.semester = params[:semester]
            @std.department = params[:department]
            @std.user_id = @user.id
            if @std.save
              render json: "1", status: 200
            else
              render json: {:errors => @std.errors.full_messages}, status: 200
            end
          else
            render json: {:errors => @user.errors.full_messages}, status: 200
          end
       else
        render json: "-1", status: 200
       end
     rescue
       render json: "-2", status: 200
     end
   end

   def update
     begin
        @user = User.find_by_email(params[:email])
        if @user
          password = params[:password]
          password_confirmation = params[:password_confirmation]
          if @user.valid_password?(params[:old_password]) && password == password_confirmation
            @user.password = password
            @user.password_confirmation = password_confirmation
            if @user.save
              render json: "1", status: 200
            else
              render json: {:errors => @user.errors.full_messages.as_json()}, status: 200
            end
          else
            render json: "0", status: 200
          end
        else
          render json: "-1", status: 200
        end
      rescue
        render json: "-2", status: 200
      end
   end
end
