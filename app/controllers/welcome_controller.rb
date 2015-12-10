class WelcomeController < ApplicationController
  before_action :skip_if_signed_in, only: [:index]

  def index
  end
end
