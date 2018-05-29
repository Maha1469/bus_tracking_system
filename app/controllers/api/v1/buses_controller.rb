class Api::V1::BusesController < ApplicationController

  def index
    begin
      @user = User.find_by_email(params[:email])
      if @user
        if @user.role == 2
          @buses = Bus.where(status: true)
          render :json => {:buses => @buses.as_json(
                            except: [:created_at, :updated_at, :starting_lat, :starting_lan, :ending_lat, :ending_lan, :status, :user_id, :address],
                            include: { stops: { only: [:id, :latitude, :longitude, :stop_number] } }
                          )}, status: 200

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

  def show
    begin
      @bus = Bus.find(params[:id])
      if @bus
        render :json => @bus.as_json(:only=> [:current_lat, :current_lan]), status: 200
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

  def update
    begin
      @bus = Bus.find(params[:id])
      @bus.current_lat = params[:current_lat]
      @bus.current_lan = params[:current_lan]
      if @bus.save
        render json: "1", status: 200
      else
        render json: "-1", status: 200
      end
    rescue
      render json: "-2", status: 200
    end
  end

end
