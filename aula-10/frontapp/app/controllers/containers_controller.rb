class ContainersController < ApplicationController
    before_action :set_container, only: [:edit, :show]
    def index
        @containers = rest_api('containers', :get)
    end

    def new
    end

    def edit
    end

    def create
        data = {
            container: {
                name: params[:name],
                container_name: Time.now.to_i
            }
        }
        rest_api('containers', :post, data)
        redirect_to action: :index
    end

    def update
        data = {
            container: {
                name: params[:name]
            }
        }
        id = params[:id]
        rest_api("containers/#{id}", :put, data)
        redirect_to action: :show, id: id
    end

    def show
    end

    def destroy
        id = params[:id]
        rest_api("containers/#{id}", :delete)
        redirect_to action: :index
    end

    private
    def set_container
        id = params[:id]
        @container = rest_api("containers/#{id}", :get)
    end

end
