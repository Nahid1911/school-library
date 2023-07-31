class Person

    attr_reader :id
    attr_accessor :name, :age

    def instance (id, name = "Unknown", age, parent_permission = true)
        @id = id
        @age = age
        @parent_permission = parent_permission
        @name = name
    end

    private def of_age?
        @age >= 18
    end

    def can_use_services?
        of_age? || @parent_permission
end
           