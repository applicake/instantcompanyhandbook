require "cases/helper"

class CallbacksTest < ActiveModel::TestCase

  class CallbackValidator
    def around_create(model)
      model.callbacks << :before_around_create
      yield
      model.callbacks << :after_around_create
    end
  end

  class ModelCallbacks
    attr_reader :callbacks
    extend ActiveModel::Callbacks

    define_model_callbacks :create
    define_model_callbacks :initialize, :only => :after
    define_model_callbacks :multiple,   :only => [:before, :around]
    define_model_callbacks :empty,      :only => []

    before_create :before_create
    around_create CallbackValidator.new

    after_create do |model|
      model.callbacks << :after_create
    end

    after_create "@callbacks << :final_callback"

    def initialize(valid=true)
      @callbacks, @valid = [], valid
    end

    def before_create
      @callbacks << :before_create
    end

    def create
      _run_create_callbacks do
        @callbacks << :create
        @valid
      end
    end
  end

  test "complete callback chain" do
    model = ModelCallbacks.new
    model.create
    assert_equal model.callbacks, [ :before_create, :before_around_create, :create,
                                    :after_around_create, :after_create, :final_callback]
  end

  test "after callbacks are always appended" do
    model = ModelCallbacks.new
    model.create
    assert_equal model.callbacks.last, :final_callback
  end

  test "after callbacks are not executed if the block returns false" do
    model = ModelCallbacks.new(false)
    model.create
    assert_equal model.callbacks, [ :before_create, :before_around_create,
                                    :create, :after_around_create]
  end

  test "only selects which types of callbacks should be created" do
    assert !ModelCallbacks.respond_to?(:before_initialize)
    assert !ModelCallbacks.respond_to?(:around_initialize)
    assert_respond_to ModelCallbacks, :after_initialize
  end

  test "only selects which types of callbacks should be created from an array list" do
    assert_respond_to ModelCallbacks, :before_multiple
    assert_respond_to ModelCallbacks, :around_multiple
    assert !ModelCallbacks.respond_to?(:after_multiple)
  end

  test "no callbacks should be created" do
    assert !ModelCallbacks.respond_to?(:before_empty)
    assert !ModelCallbacks.respond_to?(:around_empty)
    assert !ModelCallbacks.respond_to?(:after_empty)
  end

  class Violin
    attr_reader :history
    def initialize
      @history = []
    end
    extend ActiveModel::Callbacks
    define_model_callbacks :create
    def callback1; self.history << 'callback1'; end
    def callback2; self.history << 'callback2'; end
    def create
      _run_create_callbacks {}
      self
    end
  end
  class Violin1 < Violin
    after_create :callback1, :callback2
  end
  class Violin2 < Violin
    after_create :callback1
    after_create :callback2
  end

  test "after_create callbacks with both callbacks declared in one line" do
    assert_equal ["callback1", "callback2"], Violin1.new.create.history
  end
  test "after_create callbacks with both callbacks declared in differnt lines" do
    assert_equal ["callback1", "callback2"], Violin2.new.create.history
  end

end
