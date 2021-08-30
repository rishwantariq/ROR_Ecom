class CategoryPolicy < ApplicationPolicy
    attr_reader :user, :category

    def initialize(user, category)
        @user = user
        @category = category
    end
    
    def destroy?
        @user.admin? || @category.user == @user
    end

    def create?
        @user.seller? || @user.admin?
    end

    def update?
        @user.admin? || @user.seller? && @category.user == @user
    end
end