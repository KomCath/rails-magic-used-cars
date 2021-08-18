class ApplicationController < ActionController::Base
  def hello
    render html: "hello, used cars app 🛻-🚕-🚙-🚗"
  end
end
