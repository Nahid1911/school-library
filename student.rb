retuired_relative 'person'

class Student < Person

    def instance (id, name: "Unknown", age, parent_permission: true, classroom)
        super(id, name: name, age, parent_permission: parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end