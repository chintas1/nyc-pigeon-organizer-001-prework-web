require 'pry'
def nyc_pigeon_organizer(initial_data)
  # write your code here!
  template = new_template(pigeons_name_array(initial_data))
  template = fill_initial_data(initial_data, template, :gender)
  template = fill_initial_data(initial_data, template, :color)
  fill_initial_data(initial_data, template, :lives)
end

def fill_initial_data(initial_data, template, attribute)
  template.keys.each do |pigeon|
    template = get_pigeon_initial_data(initial_data, template, pigeon, attribute)
  end
  template
end

def get_pigeon_initial_data(initial_data, template, pigeon, attribute)
  initial_data[attribute].each do |pigeon_stat, pigeons|
    template[pigeon][attribute] << pigeon_stat.to_s if pigeons.include?(pigeon)
  end
  template
end

def pigeons_name_array(initial_data)
  initial_data[:gender][:male] + initial_data[:gender][:female]
end

def new_template(array)
  hash = Hash.new
  array.each do |element|
    hash[element] = {color: [], gender: [], lives:[]}
  end
  hash
end

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





nyc_pigeon_organizer({
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
})


