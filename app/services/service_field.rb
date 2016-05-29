class ServiceField
  def initialize
    @fields = Field.all
  end

  def set(id = nil, name = nil)
    @id = id if id
    @name = name if name
  end

  def setId(id)
    set(id)
  end
  
  def setName(name)
    set(nil, name)
  end

  def get
    where_line = Hash.new
    if @name
      where_line.store(:name, @name) 
      return @fields.where(where_line)
    end
    return false
  end

  def getId
    return get[0].id if get
    return false
  end

  def getName
    return get[0].name if get
    return false
  end
#  private
#  def getId(target_name)
#    return @fields.select(name: :xyz).id
#  end
#  def get_xyz
#    return getId("xyz")
#  end
end
#a = Abc.new
#s = ServiceField.new(a)
#s.get_xyz
