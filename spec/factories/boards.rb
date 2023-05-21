FactoryBot.define do
	factory :board do
		name { "Rubyについて" }
		title { "Ruby" }
		context { "aaaaaaaaaaxxxxxxxx" }
		user
		# 他の属性も必要に応じて追加できます。
	end
end