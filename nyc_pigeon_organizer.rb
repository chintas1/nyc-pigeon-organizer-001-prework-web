require 'pry'
def nyc_pigeon_organizer(data)
  # write your code here!
  template = new_template(pigeons_name_array(data))
  template = fill_data(data, template, :gender)
  template = fill_data(data, template, :color)
  fill_data(data, template, :lives)
end

def fill_data(data, template, data_type)
  template.keys.each do |pigeon|
    template = get_pigeon_data(data, template, pigeon, data_type)
  end
  template
end

def get_pigeon_data(data, template, pigeon, data_type)
  data[data_type].each do |pigeon_stat, pigeons|
    template[pigeon][data_type] << pigeon_stat.to_s if pigeons.include?(pigeon)
  end
  template
end

def pigeons_name_array(data)
  data[:gender][:male] + data[:gender][:female]
end

def new_template(array)
  hash = Hash.new
  array.each do |element|
    hash[element] = {color: [], gender: [], lives:[]}
  end
  hash
end

# def fill_gender(data, template)
#   template.keys.each do |pigeon|
#     template = get_pigeon_gender(data, template, pigeon)
#   end
#   template
# end

# def get_pigeon_gender(data, template, pigeon)
#   data[:gender].each do |sex, pigeons|
#     template[pigeon][:gender] << sex.to_s if pigeons.include?(pigeon)
#   end
#   template
# end

# def fill_color(data, template)
#   template.keys.each do |pigeon|
#     template = get_pigeon_color(data, template, pigeon)
#   end
#   template
# end

# def get_pigeon_color(data, template, pigeon)
#   data[:color].each do |color, pigeons|
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


