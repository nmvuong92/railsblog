### Mocks & Stubs
- A method stub is an implementation that returns a pre-determined value
- A mock is a stub with a built-in expectation to be satisfied during the test.
- Test Stubs help with inputs and Mock Objects help with outputs
### Double
The reason you don't need a double is because you're stubbing class methods, rather than instance methods. double is only useful for dealing with instances of the class, not the class itself.
- Here's a more specific example: let's say you are testing ```MyClass```, but in order to instantiate ```MyClass```, you need to pass in a ```FooLogger```:
```ruby
mylogger = FooLogger.new
myclass = MyClass.new logger: mylogger
```
If ```FooLogger.new``` opens a syslog socket and starts spamming it right away, every time you run your tests, you'll be logging. If you don't want to spam your logs during this test, you can instead create a double for ```FooLogger``` and stub out a method on it:
```ruby
mylogger = double(FooLogger)
mylogger.stub(:log)
myclass = MyClass.new logger: mylogger
```
Because most well-designed classes can be instantiated without any side-effects, you can usually just use the real object instead of a double, and stub methods on that instead. There are other scenarios where classes have many dependencies that make them difficult to instantiate, and doubles are a way to get past the cruft and test the thing you really care about.

In my experience, needing to use a double is a code smell, but we often have to use classes that we can't easily change (e.g. from a gem), so it's a tool you might need from time to time.

ref: 
- https://levelup.gitconnected.com/doubles-instance-doubles-and-spies-in-rspec-82e38c0746f4
- https://stackoverflow.com/a/15252724
- https://www.ombulabs.com/blog/rspec/ruby/spy-vs-double-vs-instance-double.html

A double would simulate a ``User`` object. This allows you simplify the process. If the business logic to achieve true in our ```#pet_animal ```method was significant, then the tests would take longer and also may not return what we actually want to test! Instead we can by-pass this and set the method to true automatically in our double. Allowing us to test the Pet #be_happy method.
```ruby
class User < ApplicationRecord
  has_many :pets
  def pet_animal
    true
  end
end
class Pet < ApplicationRecord
  belongs_to :user
  
  def be_happy(owner)
    if owner.pet_animal === true
      "Purr"
    end
  end
end
RSpec.describle Pet, type: :model do
  describle "#be_happy method" do
    let(:owner) { double(pet_animal: true) }
    it "expects an owner to pet it" do
      expect(described_class.new.be_happy(owner)).to eq("Purr")
    end
  end
end
# or subject at the top so that expect method is a little cleaner
RSpec.describle Pet, type: :model do
  describle "#be_happy method" do
    let(:owner) { double(pet_animal: true) }
    subject { described_class.new(name: "Petty") }
    it "expects an owner to pet it" do
      expect(subject.be_happy(owner)).to eq("Purr")
    end
  end
end
```
There are some drawbacks to using doubles though, albeit minor:
1. We are not mimicking a real life object, we are creating a phantom object. I could add methods to our owner variable that are not even in our User model and the test would still pass. RSpec will not verify the methods that we are defining here against the real class.
2. The time taken to run the test is less than the instance doubles but more than spied! Even if it is relatively small.
3. It is up to us as developers to make sure the methods match the real life methods. Which can be difficult if you consider the size the model may grow to and… methods change!

However, if you do want to your tests to be more stable and well-constructed, as well as taking a small speed hit. I would recommend using Instance Doubles in your tests instead!


