def begins_with_r(array)
  array.all? do |i|
    i.start_with?("r")
  end
end

def contain_a(array)
  array.select do |i|
    i.include?("a")
  end
end

def first_wa(array)
  (array.map { |i| i.to_s }).find do |x|
    x.start_with?("wa")
  end
end

def remove_non_strings(array)
  array.delete_if do |i|
    i.class != String
  end
end

def count_elements(coll)
  counts = Hash.new(0)
  coll.each do |x|
    counts[x] += 1
  end
  counts.map do |k, v|
    k.merge({:count => v})
  end
end

def merge_data (keys, data)
  keys.each do |name_key, name_value|
    if name_value == data.map { |name, data_info| name }
      merged_data = {name_key => name_value}.merge(data[name])
    end
  end
  merged_data
end

def find_cool (data)
  data.select do |x|
    x[:temperature] == "cool"
  end
end

def organize_schools(schools)
  list_hash = {}
  locations = []
  schools.map do |key, values|
    locations.push(values.values.reduce(:concat))
    locations.uniq!
  end
  locations.map do |i|
    list = schools.select do |key, value|
      key if schools[key].values.include?(i)
    end
    list_hash[i] = list.keys
  end
  list_hash
end
