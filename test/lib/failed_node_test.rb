require 'test_helper'
require 'json'

Jiggy = Chawk.clone 
def Jiggy.find_or_create_node(agent,key,access=:full) return nil end

describe Jiggy do
  before do
    Jiggy.clear_all_data!
    @agent =  Jiggy::Models::Agent.first || Jiggy::Models::Agent.create(:name=>"Test User")
  end

  it "needs a valid node" do

    lambda {@addr = Jiggy.addr(@agent,'a:b')}.must_raise(ArgumentError)
  end

end