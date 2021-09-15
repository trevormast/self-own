class HomeController < ApplicationController
  def index
    render inline: "HOME INDEX", layout: true
  end
end