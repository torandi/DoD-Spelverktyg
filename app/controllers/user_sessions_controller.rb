# -*- encoding: utf-8 -*-
class UserSessionsController < InheritedResources::Base
  before_filter :require_no_user, :only => [:new,:create]
  before_filter :require_user, :only=> :destroy

  actions :new, :destroy, :create

  def create
    create! do |success, failure|
      success.html do
        flash[:notice]="Inloggningen lyckades"
        redirect_back_or_default root_path
      end
      failure.html do
        flash[:error]="Felaktigt användarnamn eller lösenord"
        render :new
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    destroy! { root_url }
  end 
end
