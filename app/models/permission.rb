class Permission 
  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    if user
      allow :users, [:edit, :update] do |current_user|
        current_user.id == user.id
      end

      allow :microposts, [:edit, :new, :update] do |micropost|
        micropost.user_id == user.id
      end

      allow_param :users, :name   
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] ||= []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
      @allowed_params && @allowed_params[resource]
      @allowed_params[resource].include? attribute
  end

  def permit_params!(params)
    @allowed_params.each do |resource, attributes|
      if params[resource].respond_to? :permit
        params[resource] = params[resource].permit(*attributes)
      end
    end
 end
end