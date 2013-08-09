SPEC_PATH = File.dirname(__FILE__)

module ResourseLoader

  RES_PATH = File.join(SPEC_PATH, "resources")

  def load_resource(*args)
    name = get_resource(*args)
    File.open(name, "rb")
  end

  def get_resource(*args)
    File.join(RES_PATH, *args)
  end

end
