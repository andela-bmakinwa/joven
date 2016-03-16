class Object
  def self.const_missing(const)
    return if const.to_s == "rails"
    require const.to_s.to_snake_case
    Object.const_get(const)
  end
end
