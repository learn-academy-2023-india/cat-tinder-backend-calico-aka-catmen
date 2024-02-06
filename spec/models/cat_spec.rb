require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate  name" do
    cat = Cat.create(age: 3, enjoys: "Meow Mix, and plenty of sunshine", image: "http://tinyurl.com/3jvmk3je")
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    cat = Cat.create(name: "Whiskers", enjoys: "Meow Mix, and plenty of sunshine", image: "http://tinyurl.com/3jvmk3je")
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    cat = Cat.create(name: "Whiskers", age: 3, image: "http://tinyurl.com/3jvmk3je")
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "validates length of enjoys" do
    cat = Cat.create(name: "Whiskers", age: 3, enjoys: "Meow Mix, and plenty of sunshine", image: "http://tinyurl.com/3jvmk3je")
    expect(cat.errors[:enjoys]).to be_empty
  end

  it "should validate image" do
    cat = Cat.create(name: "Whiskers", age: 3, enjoys: "Meow Mix, and plenty of sunshine")
    expect(cat.errors[:image]).to_not be_empty
  end
end
