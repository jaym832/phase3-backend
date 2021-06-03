require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/user/) 
      if req.post?
        rawData = JSON.parse(req.body.read)
        newUser = 
        User.create(username:rawData['username'],password:rawData['password'])
        return [200, { 'Content-Type' => 'application/json' }, [ newUser.to_json ]]

      end
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => User.all}.to_json ]]


    elsif req.path.match(/meal/) 
      if req.post?
        # binding.pry
        rawData = JSON.parse(req.body.read)
        newFood = 
        Meal.create(foodType:rawData['foodType'],
        name:rawData['name'],
        calories:rawData['calories'],
        fats:rawData['fats'],
        protein:rawData['protein'],
        carbs:rawData['carbs']
        )
        return [200, { 'Content-Type' => 'application/json' }, [ newFood.to_json ]]

      end
      if req.delete?
        data = JSON.parse(req.body.read)
        # id = data["id"]
        # meal = Meal.find(id)
        meal=Meal.find(id:data['id'])
        meal.destroy 
        return [200, {'Content-Type' => 'application/json' }, [ {:message => "Deleted successfuly"}.to_json ]]
      end

        return [200, { 'Content-Type' => 'application/json' }, [ {:meals => Meal.all}.to_json ]]
  

      
    
    
      
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
