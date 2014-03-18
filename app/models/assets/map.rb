module Assets
  class Map < Asset

    has_attached_file   :attachment, styles: { small: "100x100#", medium: "150x150#", large: "250x250#" }

  end
end
