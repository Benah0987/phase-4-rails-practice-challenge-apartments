class TenantController < ApplicationController
    # creating a NEW tenant
    def create
        tenant = Tenant.new(tenant_params)
        if tenant.save
          render json: tenant, status: :created
        else
          render json: { error: tenant.errors.full_messages }, status: :unprocessable_entity
        end
    end
    # read all tenants
    def index
        tenants = Tenant.all
        render json: tenants
     end

    #  read a aingle user
     def show
        tenant = Tenant.find(params[:id])
        render json: tenant
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Tenant not found" }, status: :not_found
      end

    #   update the controller action

    def update
        tenant = Tenant.find(params[:id])
        if tenant.update(tenant_params)
          render json: tenant
        else
          render json: { error: tenant.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Tenant not found" }, status: :not_found
      end
      

      
      
end
