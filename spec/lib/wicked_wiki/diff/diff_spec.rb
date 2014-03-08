require 'spec_helper'

describe WickedWiki::Diff do
  specify "compare_articles" do
    source = "Hello mars.\nDeleted line.\nsame line\nThis line has been changed, I am deleted.\nsame line again" 
    target = "Hello pluto.\nsame line\nThis line is not like this, I am added\nadded line first.\nsame line again\nAnother added line!"
    result = [{:ins=>{:line=>1, :change=>"Hello <span class=\"ins\">pluto.</span>"}, :del=>{:line=>1, :change=>"Hello <span class=\"del\">mars.</span>"}},
             {:del=>{:line=>2, :change=>"Deleted line."}},
             {:ins=>{:line=>3, :change=>"This line <span class=\"ins\">is not like this,</span> I am <span class=\"ins\">added</span>"}, :del=>{:line=>4, :change=>"This line <span class=\"del\">has been changed,</span> I am <span class=\"del\">deleted.</span>"}},
             {:ins=>{:line=>4, :change=>"added line first."}},
             {:ins=>{:line=>6, :change=>"Another added line!"}}]
    diff = WickedWiki::Diff.new(target, source)
    expect(diff.compare_articles).to eq(result)
  end
end