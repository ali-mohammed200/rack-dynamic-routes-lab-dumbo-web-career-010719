# require_relative 'item.rb'
class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last #turn /items/Sorry into Sorry
      item = @@items.find{ |s| s.name == item_name }
      if item.class == NilClass
        resp.write "Item not found"
        resp.status = 400
      else
      resp.write item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end


# class Application
#
#   @@songs = [Song.new("Sorry", "Justin Bieber"),
#             Song.new("Hello","Adele")]
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match(/songs/)
#
#       song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
#       song = @@songs.find{|s| s.title == song_title}
#
#       resp.write song.artist
#     end
#
#     resp.finish
#   end
# end
