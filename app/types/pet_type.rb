PetType = GraphQL::ObjectType.define do
 name "Pet"
  description "A Pet"
  field :id, types.ID
  field :name, types.String
  field :person do
    type PersonType
    resolve -> (pet, args, ctx) {
      RecordLoader.for(Person).load(pet.person_id)
    }
  end
end
