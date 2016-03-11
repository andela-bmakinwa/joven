class Object
  def self.const_missing(c)
    const = c.to_s
    require c.to_s.snakize
    const.constantize
  end
end
