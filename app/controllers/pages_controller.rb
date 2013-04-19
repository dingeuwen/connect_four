class PagesController < ApplicationController

  before_filter :authenticate_user!, :only => [:private]

  def home 
  end

  def public
  end

  def private
  end

end
