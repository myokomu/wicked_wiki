class WickedWiki::DiffBy
  def initialize(target, source, init = [])
    @target = target
    @source = source
    @result = init
  end

  def diff_by_line
    @target = @target.split("\n").reject(&:empty?)
    @source = @source.split("\n").reject(&:empty?)
    iterate(:line)
    @result
  end

  def diff_by_word
    iterate(:word)
    @result[:ins] = merge(@result[:ins])
    @result[:del] = merge(@result[:del])
    @result
  end

  def iterate(type)
    t_index, s_index = 0, 0
    until(@target.empty? || @source.empty?)
      del, ins = @source.first, @target.first
      prioritize_insert = @target.length > @source.length
      insert = @target.include?(del)
      delete = @source.include?(ins)
      if del == ins
        t_index += 1
        s_index += 1
        @target.shift
        @source.shift
      elsif insert && prioritize_insert
        send("#{type}_ins_at", t_index)
        t_index += 1
      elsif delete
        send("#{type}_del_at", s_index)
        s_index += 1
      elsif insert && !prioritize_insert
       send("#{type}_ins_at", t_index)
       t_index += 1
      else
        send("#{type}_change_at", t_index, s_index)
        t_index += 1
        s_index += 1
      end
    end
     
    if !@target.empty?
      @target = [@target.join(" ")]
      send("#{type}_ins_at", t_index)
    elsif !@source.empty?
      @source = [@source.join(" ")]
      send("#{type}_del_at", s_index)
    end
  end

  def line_change_at(t_index, s_index)
    @result << {
      ins: {line: t_index+1, change: @target.shift},
      del: {line: s_index+1, change: @source.shift}
    }
  end

  def word_change_at(t_index, s_index)
    word_ins_at t_index
    word_del_at s_index
  end

  def merge(arr)
    i = 1
    open = /^<span class="(ins|del)">/
    close = /<\/span>/
    until arr[i].nil? 
      if arr[i-1] =~ open && arr[i] =~ open 
        arr[i-1] = arr[i-1].gsub(close, "") + " " + arr[i].gsub(open, "")
        arr.delete_at(i)
      else
        i += 1 
      end
    end 
    arr.join(" ")
  end 
 
  def method_missing(met, *args, &block)
    if met =~ /^(line|word)_(ins|del)_at$/
      key = met[/ins|del/].to_sym
      idx = args[0]
      content = key.eql?(:ins) ? @target.shift : @source.shift
      @result << { key => {line: idx+1, change: content } } if met =~ /line/
      @result[key][idx] = ("<span class=\"#{key}\">" + content + "</span>") if met =~ /word/
    else
      super
    end
  end
end