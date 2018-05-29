class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    @drivers = User.where(role: 1).count
    @buses = Bus.all.count
    @active = Bus.where(status: true).count
    @unactive = Bus.where(status: false).count
    @std = Student.all.count
    @std_approve = Student.where(approve: true).count
    @std_unapprove = Student.where(approve: false).count
  end
end
