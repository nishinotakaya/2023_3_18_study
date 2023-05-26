FactoryBot.define do
	factory :user do
		name { Faker::Name.unique.name }
		password { "password" }
		password_confirmation { "password" }
		# 他の属性も必要に応じて追加できます。
	end
end