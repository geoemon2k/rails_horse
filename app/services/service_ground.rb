class ServiceGround
  def initialize
    @grounds = Ground.all
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
    elsif @id
      where_line.store(:id, @id)
    else
      return false
    end
    return @grounds.where(where_line)
  end

  def getId
    return get[0].id if get
    return false
  end

  def getName
    return get[0].name if get
    return false
  end
end
