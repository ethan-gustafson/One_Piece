class ScraperHelper
  def self.read_file(file)
    File.read(file)
  end

  def self.obj_to_arr_of_hashes(obj)
    arr = []
    obj.each do |e|
      hash = {}
      e.instance_variables.map do |v|
        hash[v[1..-1].to_sym] = e.instance_variable_get(v)
      end
      arr.push(hash)
    end
    arr
  end
end