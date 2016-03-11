require "spec_helper"
 
describe "Utility Methods" do
  context "#to_snake_case" do
    context "PersonController" do
      it { expect("PersonController".to_snake_case).to eq "person_controller" }
    end
 
    context "Person" do
      it { expect("Person".to_snake_case).to eq "person" }
    end
 
    context "Todo::Person" do
      it { expect("Todo::Person".to_snake_case).to eq "todo/person" }
    end
 
    context "PERSONController" do
      it { expect("PERSONController".to_snake_case).to eq "person_controller" }
    end
 
    context "Person8Controller" do
      it { expect("Person8Controller".to_snake_case).to eq "person8_controller" }
    end
 
    context "personcontroller" do
      it { expect("personcontroller".to_snake_case).to eq "personcontroller" }
    end
 
    context "person" do
      it { expect("person".to_snake_case).to eq "person" }
    end
  end

  context "#to_camel_case" do
    context "PersonController" do
      it { expect("PersonController".to_camel_case).to eq "PersonController" }
    end
    context "person_controller" do
      it { expect("PersonController".to_camel_case).to eq "PersonController" }
    end
  end
end