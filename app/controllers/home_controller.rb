class HomeController < ApplicationController
  def index
    @animals=Animal.all
    @count=Animal.count
    @active=true
  end
end
