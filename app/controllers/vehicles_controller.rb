class VehiclesController < ActionController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  # TODO get current user
  def new
    @vehicle = Vehicle.new
    @vehicle.user = @current_user
  end
  
  # finish defining create
  def create
    @vehicle = Vehicle.new(vehicle_params)
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :brand,
      :model,
      :trim,
      :year,
      :vin,
      :external_color,
      :price,
      :info
    )
  end
end
