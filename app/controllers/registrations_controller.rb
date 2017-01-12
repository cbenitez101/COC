class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
  	super
  	@user.rol = 2
    if @user.save
      Profile.create(user_id: @user.id)
      History.create(user_id: @user.id)
    end
    # add custom create logic here
  end

  def update
    super
  end
end 