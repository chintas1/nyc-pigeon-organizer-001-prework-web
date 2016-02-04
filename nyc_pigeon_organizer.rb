require 'pry'
def get_pigeons_name_array(initial_data)
  initial_data.fetch(:gender).values.flatten
end

def nyc_pigeon_organizer(initial_data)
  get_pigeons_name_array(initial_data).each_with_object({}) do |pigeon_name, formatted_hash|
    formatted_hash[pigeon_name] = get_pigeon_data_hash(initial_data, pigeon_name)
  end
end

def get_pigeon_data_hash(initial_data, pigeon_name)
  initial_data.keys.each_with_object({}) do |attribute_type, pigeon_data_hash|
    pigeon_data_hash[attribute_type] = get_attribute_array(initial_data, pigeon_name, attribute_type)
  end
end

def get_attribute_array(initial_data, pigeon_name, attribute_symbol)
  initial_data.fetch(attribute_symbol).collect do |attribute_value, pigeons_w_attribute|
    attribute_value.to_s if pigeons_w_attribute.include?(pigeon_name)
  end.compact
end

##### Old Version With Template
# def nyc_pigeon_organizer(initial_data)
#   # write your code here!
#   template = new_data_form_template(pigeons_name_array(initial_data))
#   template = fill_with_initial_data(initial_data, template, :gender)
#   template = fill_with_initial_data(initial_data, template, :color)
#   fill_with_initial_data(initial_data, template, :lives)
# end

# def fill_with_initial_data(initial_data, template, attribute)
#   template.keys.each do |pigeon|
#     template = get_pigeon_initial_data(initial_data, template, pigeon, attribute)
#   end
#   template
# end

# def get_pigeon_initial_data(initial_data, template, pigeon, attribute)
#   initial_data.fetch(attribute).each do |pigeon_attribute_value, pigeons_w_attribute|
#     template.fetch(pigeon).fetch(attribute) << pigeon_attribute_value.to_s if pigeons_w_attribute.include?(pigeon)
#   end
#   template
# end

# def pigeons_name_array(initial_data)
#   initial_data.fetch(:gender).fetch(:male) + initial_data.fetch(:gender).fetch(:female)
# end

# def new_data_form_template(pigeon_names)
#   pigeon_names.each_with_object({}) do |pigeon_name, new_data_template|
#     new_data_template[pigeon_name] = {color: [], gender: [], lives:[]}
#   end
# end


##### Old Version With Broken Up fill method
# def fill_gender(initial_data, template)
#   template.keys.each do |pigeon|
#     template = get_pigeon_gender(initial_data, template, pigeon)
#   end
#   template
# end

# def get_pigeon_gender(initial_data, template, pigeon)
#   initial_data[:gender].each do |sex, pigeons|
#     template[pigeon][:gender] << sex.to_s if pigeons.include?(pigeon)
#   end
#   template
# end

# def fill_color(initial_data, template)
#   template.keys.each do |pigeon|
#     template = get_pigeon_color(initial_data, template, pigeon)
#   end
#   template
# end

# def get_pigeon_color(initial_data, template, pigeon)
#   initial_data[:color].each do |color, pigeons|
#     template[pigeon][:color] << color.to_s if pigeons.include?(pigeon)
#   end
#   template
# end