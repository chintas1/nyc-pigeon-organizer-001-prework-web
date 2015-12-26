def nyc_pigeon_organizer(data)
  # write your code here!
  organized = {}
  data.each do |info_type, info|
    info.each do |attribute, pigeons|
      pigeons.each do |pigeon|
        if(!(organized.keys.include?(pigeon)))
          organized[pigeon] = {color: [], gender: [], lives: []}
          organized[pigeon][info_type] << attribute.to_s
        else
          organized[pigeon][info_type] << attribute.to_s
        end
      end
    end
  end
  organized
end