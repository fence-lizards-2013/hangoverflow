module ApplicationHelper
  def link_to_add_fields(name, f, association)
    # name = Add Ingredient, f references form builder var f, association :ingredients
    new_object = f.object.send(association).klass.new
    # f.object = @cocktail , send = f.object will 'send' (call) the assocition, so ingredients. summary = @cocktail.ingredients
    # klass = class Ingredient, object you want to initialize
    id = new_object.object_id
    # object_id is a Ruby method to assign a unique ID to these objects
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
    # This will make the HTML id elements unique
      render(association.to_s.singularize, f: builder)
    #This will render a ingredient_fields, with the fields for f object
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n","")})
    #This will link to name (Add Ingredient) with the id and fields as part of the data attribute of the HTML anchor 
  end

  def gravatar_url(user_email)
    user_email.strip!
    user_email.downcase!
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(user_email)
  end
end
