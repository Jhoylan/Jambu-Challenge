class RequestsController < ApplicationController
  def new
  end

  def research
    type = params[:type][:field]
    number = params[:number][:field]

    response = HTTParty.get('https://swapi.dev/api/' + type + '/' + number + '/')

    if response.code < 299
      if type == 'people'
        @result = {
          name: response["name"], 
          height: response["height"], 
          mass: response["mass"], 
          hair_color: response["hair_color"], 
          skin_color: response["skin_color"], 
          eye_color: response["eye_color"], 
          birth_year: response["birth_year"], 
          gender: response["gender"]
        } 
      end 

      if type == 'planets'
        @result = {
          name: response["name"], 
          rotation_period: response["rotation_period"], 
          orbital_period: response["orbital_period"], 
          diameter: response["diameter"], 
          climate: response["climate"], 
          gravity: response["gravity"], 
          terrain: response["terrain"], 
          surface_water: response["surface_water"], 
          population: response["population"] 
        } 
      end 

      if type == 'starships'
        @result = {
          name: response["name"], 
          model: response["model"], 
          manufacturer: response["diamemanufacturerter"], 
          cost_in_credits: response["cost_in_credits"], 
          length: response["length"], 
          max_atmosphering_speed: response["max_atmosphering_speed"], 
          crew: response["crew"], 
          passengers: response["passengers"], 
          cargo_capacity: response["cargo_capacity"], 
          consumables: response["consumables"], 
          hyperdrive_rating: response["hyperdrive_rating"], 
          MGLT: response["MGLT"], 
          starship_class: response["starship_class"]
        } 
      end 

    else
      @result = {
        result: "Sorry, we're unable to find an answer for your search" 
      }
    end    
  end 
end
