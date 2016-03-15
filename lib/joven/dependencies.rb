class Object
  def self.const_missing(const)
    p const.to_s.to_snake_case
    require const.to_s.to_snake_case
    Object.const_get(const)
  end
end
