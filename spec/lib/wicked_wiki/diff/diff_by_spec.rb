require 'spec_helper'

describe WickedWiki::DiffBy do
  specify "diff by line" do
    source = "Hello mars.\nDeleted line.\nsame line\nThis line has been changed, I am deleted.\nsame line again" 
    target = "Hello pluto.\nsame line\nThis line is not like this, I am added\nadded line first.\nsame line again\nAnother added line!"
    result = [
      {:ins=>{:line=>1, :change=>"Hello pluto."}, :del=>{:line=>1, :change=>"Hello mars."}},
      {:del=>{:line=>2, :change=>"Deleted line."}},
      {:ins=>{:line=>3, :change=>"This line is not like this, I am added"}, :del=>{:line=>4, :change=>"This line has been changed, I am deleted."}},
      {:ins=>{:line=>4, :change=>"added line first."}},
      {:ins=>{:line=>6, :change=>"Another added line!"}}
    ]
    diff = WickedWiki::DiffBy.new(target, source)
    expect(diff.diff_by_line).to eq(result)
  end

  specify "diff by word" do
    source = %w(hello mars. This is great, not good, great)
    target = %w(hello pluto. This is awesome, great and awesome)
    init   = {:ins => target.dup, :del => source.dup}
    result = {
      :ins=>"hello <span class=\"ins\">pluto.</span> This is <span class=\"ins\">awesome,</span> great <span class=\"ins\">and awesome</span> awesome", 
      :del=>"hello <span class=\"del\">mars.</span> This is <span class=\"del\">great, not good,</span> great"
    }
    diff = WickedWiki::DiffBy.new(target, source, init)
    expect(diff.diff_by_word).to eq(result)  	
  end
end