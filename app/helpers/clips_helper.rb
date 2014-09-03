module ClipsHelper
  def star_button(f, clip, value, checked)
    if value == checked
      radio_button("rating[#{clip.id}]","", value,:name => "rating", :class => 'star', "data-clip" => clip.id, :checked => "checked")
    else
      radio_button("rating[#{clip.id}]","", value,:name => "rating", :class => 'star', "data-clip" => clip.id)
    end
  end
end
