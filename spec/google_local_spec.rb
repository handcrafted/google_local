require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GoogleLocal" do
  
  it "has a verson" do
    GoogleLocal::Version.should_not be_nil
  end
  
end
