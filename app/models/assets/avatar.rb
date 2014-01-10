module Assets
  class Avatar < Asset
    
    has_attached_file   :attachment, styles: { tiny: "35x35#", small: "50x50#", medium: "75x75#", large: "150x150#" }
    
  end
end