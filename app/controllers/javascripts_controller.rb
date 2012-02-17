class JavascriptsController < ApplicationController
  def hide_announcement
    session[:announcement_hide_time] = Time.current
  end
end
