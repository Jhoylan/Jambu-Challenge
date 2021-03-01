class RequestsController < ApplicationController
  def new
  end

  def research
    data_type = params[:type][:field]
    number = params[:number][:field]

    response = HTTParty.get('https://swapi.dev/api/' + data_type + '/' + number + '/')

    if response.code < 299
      if data_type == 'people'
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

      if data_type == 'planets'
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

      if data_type == 'starships'
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

      if params[:save] == '1'
        username = params[:userName][:field]
        favorite = Favorite.new(name: username, favorite: @result, dataType: data_type)

        isNewFavorite = true

        Favorite.all.each do favorite
          if favorite.name == username && favorite == @result
            isNewFavorite = false
          end
        end

        if isNewFavorite && !username == 'nil'
          favorite.save
          @savingStatus = 'Information successfully saved on our database'
        else
          @savingStatus = "We're unable to save this information"
        end
      end

      
    else
      render :pageNotFound
    end    
  end 

  def searchFavorites
  end

  def showFavorites
    @starships = []
    @people = []
    @planets = []
    @starshipsRoute = []
    @peopleRoute = []
    @planetsRoute = []
    

    Favorite.all.each do |favorite|
      if params[:userName][:field] == favorite.name
        if favorite.dataType == "people"
          @people.push(favorite.favorite[:name])
          @peopleRoute.push("http://localhost:3000/" + favorite.id.to_s)
        end

        if favorite.dataType == "planets"
          @planets.push(favorite.favorite[:name])
          @planetsRoute.push("http://localhost:3000/" + favorite.id.to_s)
        end

        if favorite.dataType == "starships"
          @starships.push(favorite.favorite[:name])
          @starshipsRoute.push("http://localhost:3000/" + favorite.id.to_s)
        end
      end
    end   
  end

  def show
    @result = Favorite.find(params[:id]).favorite
    render :research
  end
end
