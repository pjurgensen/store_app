class ArticlesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
end
