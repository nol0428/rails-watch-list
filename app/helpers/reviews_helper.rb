module ReviewsHelper
  def stars_for(rating, out_of: 5)
    full = rating.to_i.clamp(0, out_of)
    empty = out_of - full
    full_icons  = Array.new(full)  { content_tag(:i, "", class: "fa-solid fa-star") }
    empty_icons = Array.new(empty) { content_tag(:i, "", class: "fa-regular fa-star") }
    safe_join(full_icons + empty_icons)
  end
end
