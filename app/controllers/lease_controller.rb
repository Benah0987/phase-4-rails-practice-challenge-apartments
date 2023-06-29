class LeaseController < ApplicationController
    # creating  a new use
    def create
        lease = Lease.new(lease_params)
        if lease.save
          render json: lease, status: :created
        else
          render json: { error: lease.errors.full_messages }, status: :unprocessable_entity
        end
      end

    #   delete 
    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Lease not found" }, status: :not_found
     end
      
      
end
