class Object
  def self.const_missing(const)
    return if const.to_s == "Rails"
    const =  const.to_s
    require const.to_snake_case
    const.to_constant
  end
end
