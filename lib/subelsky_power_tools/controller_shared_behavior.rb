# https://www.relishapp.com/rspec/rspec-core/v/2-10/docs/example-groups/shared-examples
shared_examples "a protected plural controller" do |skip_actions|
  # if you specify a "request options" method in your test, we use that when making requests.
  # useful for testing nested controllers, e.g. if you were testing a comments controller
  # that used nested routes like /:post_id/comments, you could do this:
  #
  # let(:request_options) { { post_id: 5 } }
  let(:protected_plural_controller_options) { defined?(request_options) ? request_options : {} }

  describe "new", :if => described_class.instance_methods.include?(:new) && not(Array(skip_actions).include?(:new)) do
    it "requires signin" do
      get :new, protected_plural_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "edit", :if => described_class.instance_methods.include?(:edit) && not(Array(skip_actions).include?(:edit)) do
    def simple_get(obj_id = 1)
      get :edit, protected_plural_controller_options.merge(id: obj_id)
    end

    it "requires signin" do
      simple_get
      response.should redirect_to signin_redirect
    end

    it "only allowed for objects owned by the signed-in user" do
      user_sign_in_proc.call
      simple_get(object_not_owned_by_user.id)
      response.should redirect_to not_found_redirect
    end
  end

  describe "show", :if => described_class.instance_methods.include?(:show) && not(Array(skip_actions).include?(:show)) do
    def simple_get(obj_id = 1)
      get :show, protected_plural_controller_options.merge(id: obj_id)
    end

    it "requires signin" do
      simple_get
      response.should redirect_to signin_redirect
    end

    it "only allowed for objects owned by the signed-in user" do
      user_sign_in_proc.call
      simple_get(object_not_owned_by_user.id)
      response.should redirect_to not_found_redirect
    end
  end

  describe "index", :if => described_class.instance_methods.include?(:index) && not(Array(skip_actions).include?(:index)) do
    it "requires signin" do
      get :index
      response.should redirect_to signin_redirect
    end
  end

  describe "create", :if => described_class.instance_methods.include?(:create) && not(Array(skip_actions).include?(:create)) do
    it "requires signin" do
      post :create, protected_plural_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "update", :if => described_class.instance_methods.include?(:update) && not(Array(skip_actions).include?(:update)) do
    def simple_put(obj_id = 1,params = {})
      put :update, params.merge(id: obj_id).merge(protected_plural_controller_options)
    end

    it "requires signin" do
      simple_put
      response.should redirect_to signin_redirect
    end

    it "only allowed for objects owned by the signed-in user" do
      user_sign_in_proc.call
      expect {
        simple_put(object_not_owned_by_user.id,valid_change_params)
      }.not_to change {
        object_not_owned_by_user.reload.attributes.values_at(valid_change_params.keys)
      }

      response.should redirect_to not_found_redirect
    end
  end

  describe "delete", :if => described_class.instance_methods.include?(:destroy) && not(Array(skip_actions).include?(:destroy)) do
    def simple_delete(obj_id = 1)
      delete :destroy, protected_plural_controller_options.merge(id: obj_id)
    end

    it "requires signin" do
      simple_delete
      response.should redirect_to signin_redirect
    end

    it "only allowed for objects owned by the signed-in user" do
      user_sign_in_proc.call
      simple_delete(object_not_owned_by_user.id)
      expect { object_not_owned_by_user.reload }.not_to raise_error
      response.should redirect_to not_found_redirect
    end
  end
end

shared_examples "a protected singular controller" do |skip_actions|
  let(:protected_singular_controller_options) { defined?(request_options) ? request_options : {} }
  describe "new", :if => described_class.instance_methods.include?(:new) && not(Array(skip_actions).include?(:new)) do
    it "requires signin" do
      get :new, protected_singular_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "edit", :if => described_class.instance_methods.include?(:edit) && not(Array(skip_actions).include?(:edit)) do
    it "requires signin" do
      get :edit, protected_singular_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "show", :if => described_class.instance_methods.include?(:show) && not(Array(skip_actions).include?(:show)) do
    it "requires signin" do
      get :show, protected_singular_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "create", :if => described_class.instance_methods.include?(:create) && not(Array(skip_actions).include?(:create)) do
    it "requires signin" do
      post :create, protected_singular_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "update", :if => described_class.instance_methods.include?(:update) && not(Array(skip_actions).include?(:update)) do
    it "requires signin" do
      put :update, protected_singular_controller_options
      response.should redirect_to signin_redirect
    end
  end

  describe "delete", :if => described_class.instance_methods.include?(:destroy) && not(Array(skip_actions).include?(:destroy)) do
    it "requires signin" do
      delete :destroy, protected_singular_controller_options
      response.should redirect_to signin_redirect
    end
  end
end
