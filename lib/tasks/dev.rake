# encoding: utf-8
namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]

  task :fetch_items_back => :environment do

    require 'open-uri'
    body = ''
    open('https://spreadsheets.google.com/feeds/cells/0Ar04UTOMtXbQdHphbFNVcDBhSVhOWlhReVlScldLRGc/od6/public/basic?alt=json'){|io|
      body = io.read
    }
    parsed_json = ActiveSupport::JSON.decode(body)
    i = 7
    while(i < parsed_json["feed"]["entry"].size) do
      c = Clip.new
      c.title = parsed_json["feed"]["entry"][i]["content"]["$t"]
      c.discription = parsed_json["feed"]["entry"][i + 1]["content"]["$t"]
      c.url = parsed_json["feed"]["entry"][i + 2]["content"]["$t"]
      c.tag_list << parsed_json["feed"]["entry"][i + 3]["content"]["$t"]
      case parsed_json["feed"]["entry"][i + 4]["content"]["$t"]
        when "五星"
          c.rating = 5
        when "四星"
          c.rating = 4
        when "三星"
          c.rating = 3
        when "二星"
          c.rating = 2
        when "一星"
          c.rating = 1
        else 
      end
      c.video_id = Clip.parse_video_id parsed_json["feed"]["entry"][i + 2]["content"]["$t"]
      c.category_list << parsed_json["feed"]["entry"][i + 5]["content"]["$t"]
      c.is_hot = parsed_json["feed"]["entry"][i + 6]["content"]["$t"]
      c.save
      i += 7
    end
  end
end