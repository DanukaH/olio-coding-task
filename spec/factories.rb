FactoryBot.define do
  factory(:article) do
    title { Faker::Book.title }
    description { 'Example Description' }
  end
end
