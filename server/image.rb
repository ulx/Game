 require "command"
 require "config/config"
 require "managerBase"
class Image <  Command

  def initialize(server, mDB, config)
    super(server)
    @color = "black"
    @size = "2em"
    @m_db = mDB
    @config = config

  end
  def do_stuff_with(request)
   #content = "<p style=\"color: #{@color}; font-size: #{@size}\">some text"
   #content = run(request)
   #download()

    @filename = "/static/clover/Images/Image1.png"
   content = "attachment; filename=" + @filename
    return 200, "application/x-download", content
  end
def run(request)
  return "image"
end
end