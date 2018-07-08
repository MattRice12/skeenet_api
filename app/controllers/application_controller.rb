class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  INDEX_ERROR = "The server blew up. Tell Matt to run the migrations."
end
