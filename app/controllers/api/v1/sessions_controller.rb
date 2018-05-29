class Api::V1::SessionsController < ApplicationController
  def create
    begin
      @user = User.find_by_email(params[:email])
      user_password = params[:password]
      if @user && @user.valid_password?(user_password)
        if @user.role == 1
          #render json: { :user => @user.as_json(:except => [:created_at, :updated_at], :include => [:bus])}, status: 200
          render :json => {:user => @user.as_json(
                            except: [:created_at, :updated_at],
                            include: {
                               bus: {
                                      only: [:id, :current_lat, :current_lan, :evening_start_time,:evening_end_time, :morning_start_time,
                                            :morning_end_time, :bus_number],
                                      include: [:stops]
                                    }
                            }
                          )}, status: 200
        elsif @user.role == 2
          if @user.student.approve
            render json: { :user => @user.as_json(:except => [:created_at, :updated_at], :include => [:student])}, status: 200
          else
            render json:  "-3", status: 200
          end
        else
          render json:  "0", status: 200
        end
      else
        render json:  "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

end
