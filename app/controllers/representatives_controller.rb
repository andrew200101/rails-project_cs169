# frozen_string_literal: true

class RepresentativesController < ApplicationController
    def index
        @representatives = Representative.all
    end

    def show
        @representatives = Representative.find(params[:representative_id])
    end
end
