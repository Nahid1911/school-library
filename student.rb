retuired_relative 'person'

class Student < Person
    def instance (id, age, classroom, parent_permission: true, name: "Unknown")
        super(id, age, parent_permission: parent_permission, name: name)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end