class Ability
  include CanCan::Ability

  def initialize(user)
      if user
       if user.admin?
         can :manage, :all
       else
         can [:read, :update], :user, :id=>user.id
       end
      end
  end
end
