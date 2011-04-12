require "Command"
require "managerBase"
require "config/config"
class Turn  < Command
   def initialize(server, m_db, config)
    super(server)
    @m_db = m_db
    @config = config
    @query = "select  field.id, field.x, field.y, field.state_id, plants.name  from field, plants where field.plant_id = plants.plant_id"
    @query1 = "update  field set state_id=state_id+1  where field.plant_id = 2 and field.state_id < 5"
    @query2 = "update  field set state_id=state_id+1  where field.plant_id = 3 and field.state_id < 10"
    @query3 = "update  field set state_id=state_id+1  where field.plant_id = 4 and field.state_id < 15"
  end
  def do_stuff_with(request)
    content =  run()
    return 200, "text/xml", content
  end
  def run()
    @xml = Array.new()
    @xml.push('<?xml version="1.0" ?>')
    @xml.push("<country><field size_x="+ '"' + @config.field_x + '"' + " size_y="+ '"' + @config.field_x + '"' + ' zero_x="0" zero_y="0">')
    @xml.push(create_body_xml())
    @xml.push('</field></country>')
    @xml.to_s
  end
  def create_body_xml()
    turn_sql()
     @res = @m_db.query(@query)
     @s = Array.new()
     @res.each do |row| p row
          @s.push( "<" +"#{row["name"]}"+ " id=" +'"'+ "#{row["id"]}" + '"' + " state=" + '"' + "#{row["state_id"]}"+ '"' " x=" +'"' "#{row["x"]}" '"'+ " y=" +'"'+ "#{row["y"]}"+ '"' "/>")
     end
     @s
  end
  def turn_sql()
     @m_db.query(@query1)
     @m_db.query(@query2)
     @m_db.query(@query3)
  end
end