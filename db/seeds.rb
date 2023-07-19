# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  User.create([
    {name: 'takaya',
    password: 'password'
  },
    {name: 'kazuya',
    password: 'password'
  },
    {name: 'takashi',
    password: 'password'
  },
    {name: 'kida',
    password: 'password'
  },
    {name: 'tetsu',
    password: 'password'
  },
    {name: 'tanaka',
    password: 'password'
  }
  ])
  (1..15).each do |i|
    if i == 1
      Board.create(name: "名無しのゴンベイ", title: "プログラミング", body: "つら楽しいwwwwwwww", user_id: 1)
    elsif i == 2
      Board.create(name: "どっかの介護士", title: "勤怠A", body: "わけ分からん！😓", user_id: 2)
    elsif i == 3
      Board.create(name: "にっしー", title: "街コン", body: "今日も惨敗" , user_id: 1)
    elsif i == 4
      Board.create(name: "貴O", title: "ダイエット", body: "３３日継続！！！！", user_id: 3)
    elsif i == 5
      Board.create(name: "にしO", title: "恋愛について", body: "１０００円のコンサル受けてきたぜい！", user_id: 3)
    else
      Board.create(name: "受講生#{i}", title: "目指せフリーランスエンジニア", body: "目指せ月収#{i}0万円", user_id: 2)
    end
  end

end
