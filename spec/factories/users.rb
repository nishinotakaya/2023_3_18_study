FactoryBot.define do
	factory :user do
		name { "Test User" }
		email { "test@example.com" }
		password { "password" }
		password_confirmation { "password" }
		# 他の属性も必要に応じて追加できます。
	end
end