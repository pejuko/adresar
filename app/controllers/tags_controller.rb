class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @firms = @tag.firms
  end
end
