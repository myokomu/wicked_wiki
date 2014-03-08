module WickedWiki
  module DiffHelper
    def render_diff(diff)
      if diff.present?
        markdown "@#{diff[:line].to_s.gsub("_"," ")} " + diff[:change]
      end
    end
  end
end
