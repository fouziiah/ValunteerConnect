# frozen_string_literal: true

class DiscoverOpportunitiesController < ApplicationController
  def search
    @opportunities = if params[:search]
                       CreateOpportunity.where('title ILIKE ? OR location ILIKE ?', "%#{params[:search]}%",
                                               "%#{params[:search]}%").distinct
                     else
                       CreateOpportunity.all
                     end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @create_opportunity = CreateOpportunity.find(params[:id])
  end

  def edit
    @create_opportunity = CreateOpportunity.find(params[:id])
  end
end
