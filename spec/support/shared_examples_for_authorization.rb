shared_examples_for "not authorized to" do |action, resource|
  it "#{action} will be redirected to wikis_path" do
    controller.stub(:user_authorized_to?).with(action.to_s).and_return(false)
    http_method(action, resource)
    expect(response).to redirect_to wikis_path
    flash[:danger].should_not be_nil
  end
end

def http_method(action, resource)
  case action
  when :new
    get action
  when :create
    post action, {wiki: { title: "title", content: "content", protection: "semi-protection", ip: "120.1.1.1"} }
  when :edit
    get action, { id: facgurl(resource) }
  when :update
    patch action, { id: facgurl(resource) }, {wiki:  {content:"changed"} }
  when :destroy
    delete action, { id: facgurl(resource) }
  end
end

