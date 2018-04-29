MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :addPerson, PersonType do
    description "Adds a person"
    argument :name, !types.String

    resolve ->(obj, args, ctx) {
      person = Person.create(name: args[:name])
      person
    }
  end
end
