require File.expand_path("../diff_by", __FILE__)
class WickedWiki::Diff
  def initialize(target, source)
    @target = target
    @source = source
  end

  def compare_articles
    line_diff = WickedWiki::DiffBy.new(@target, @source).diff_by_line
    result = line_diff.inject([]) do |r, e| 
      if e.has_key?(:ins) && e.has_key?(:del)
        target = e[:ins][:change].split(" ")
        source = e[:del][:change].split(" ")
        init = {ins: target.dup, del: source.dup}
        line = WickedWiki::DiffBy.new(target, source, init).diff_by_word
        e[:ins][:change] = line[:ins]
        e[:del][:change] = line[:del]
      end
      r << e
    end
    result
  end
end