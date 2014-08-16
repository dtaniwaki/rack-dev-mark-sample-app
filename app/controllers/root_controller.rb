class RootController < ApplicationController
  skip_rack_dev_mark only: [:no_rack_dev_mark]

  def index
  end

  def no_rack_dev_mark
    render :index
  end
end
