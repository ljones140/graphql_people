MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :addPerson, PersonType do
    description "Adds a person"
    argument :person, PersonInputType

    resolve ->(obj, args, ctx) do
      person = Person.create(name: args[:person][:name], surname: args[:person][:surname])
      pet = args[:person][:pet_name]
      person.pets.create(name: pet) if pet.present?
      person
    end
  end
end

PersonInputType = GraphQL::InputObjectType.define do
  name "PersonInputType"
  description "Properties for creating a Person"

  argument :name, !types.String do
    description "Name of person"
  end

  argument :surname, !types.String do
    description "Surname of person"
  end

  argument :pet_name, types.String do
    description "Name of pet"
  end
end
