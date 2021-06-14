class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def create
        # byebug
        tenant = Tenant.new(tenant_params)

        if tenant.valid?
            tenant.save
            render json: tenant
        else
            render json: {errors: tenant.errors.full_messages}
        end
    end

    def update
        tenant = Tenant.find(params[:id])
        # byebug
        tenant.assign_attributes(tenant_params)
        if tenant.valid?
            tenant.save
            render json: tenant
        else
            render json: {errors: tenant.errors.full_messages}
        end
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        render json: {message: "tenant is deleted!!!"}
    end


    private

    def tenant_params
        params.permit(:name, :age)
    end
end
