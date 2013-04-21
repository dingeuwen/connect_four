class PagesController < ApplicationController

  before_filter :authenticate_user!, :only => [:private]

  def home 
  end

  def public
  end

  def private
  end

  def send_email
    ConnectFourMailer.form_email(params[:to], params[:subject], params[:body]).deliver
  end

end
