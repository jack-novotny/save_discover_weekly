class ApplicationController < ActionController::Base
  require 'rspotify'
  
  protect_from_forgery with: :exception
end
