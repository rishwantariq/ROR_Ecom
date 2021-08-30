class ProductPolicy < ApplicationPolicy
    attr_reader :user, :product

    def initialize(user, product)
        @user = user
        @product = product
    end
    
    def destroy?
        @user.admin? || @product.user == @user
    end

    def create?
        @user.seller? || @user.admin?
    end

    def update?
        @user.admin? || @user.seller? && @product.user == @user
    end

    def show?        
    end

end