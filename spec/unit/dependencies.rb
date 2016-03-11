require "spec_helper"
$LOAD_PATH.unshift File.expand_path("../helpers", __FILE__)

describe "Helpers Methods" do
  context "#const_missing" do
    it { expect("Person".to_constant).to eq Person }

    it { expect("Todo".to_constant).to eq Todo }

    it { expect("PersonController".to_constant).to eq PersonController }
  end
end
