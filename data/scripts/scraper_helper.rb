class ScraperHelper
  def self.read_file(file)
    File.read(file)
  end

  def self.object_to_array_of_hashes(object)
    array = []
    object.each do |obj|
      hash = {}
      obj.instance_variables.map do |instance_var|
        hash[instance_var[1..-1].to_sym] = obj.instance_variable_get(instance_var)
      end
      array.push(hash)
    end
    array
  end
end