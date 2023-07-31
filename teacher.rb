retuired_relative 'person'

class Teacher < Person
    def instance (id, name: "Unknown", age, parent_permission: true, specialization)
        super(id, name: name, age, parent_permission: parent_permission)
        @specialization = specialization
    end

    
end
