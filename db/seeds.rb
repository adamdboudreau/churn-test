# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Time to seed some data"

texts = ['"I was excited to help and with the crowd...It got a little dusty again."- It was an emotional game for @BriBrows22 & all of us at The Rock.','More Tomorrow, during the warm-up before de game, the players will wear a lavender jersey as part of the Hockey Fights Cancer Month.','These jerseys will be auctioned at the beginning of the game to benefit @Leucan.','A new jersey is born, with roots from Hamiltons only NHL team.','The Bulldogs continue the legacy as they skate on the ice this Saturday. Be a part of Bulldogs history',"It's Game Day: The Battle of Ontario begins this afternoon at @AirCanadaCentre when the #Marlies host the Senators.", "Puck drops at 1:30 on Leafs Nation Network (TV) and AHL Live.", "Firebirds Acquire OHL First-Rounder Connor Roberts (@10robertshky) & Three Draft Picks in Trade with @BulldogsOHL. Details >> http://bit.ly/2Bod7Tx" ,"Tell us who will score our first goal for a chance to win tickets to our Dec. 2 game! Use the hashtag #Flames1stGoal with your guess!","We all have someone to fight for.","For Jets' Asst. Coach Jamie Kompon & his wife Tina, their fight started in Oct 2015.","It’s official, Carey Price says he is in vs. Sabres Saturday @Sportsnet", ".@Katiaa19 unveils our new team apparel! Thank you to team apparel sponsor Crystalline Management!", "More Rob Kerr Retweeted Wes Gilbertson", "More great work from @WesGilbertson.Rob Kerr added,", "Some interesting insights from #Flames bench boss Glen Gulutzan on how Jaromir Jagr's arrival in Calgary has been big-time beneficial to LW Johnny Gaudreau ...", "Big congratulations to Assistant Captain @Schlickk1 on recording his 200th career @OHLHockey game tonight in Mississauga! - Extremely happy all 200 have been with the #Sting!", "Make that four wins in a row! #Preds victorious 2-0 and the man himself, Pekka Rinne, gets the shutout. #NSHvsSTL", "About Help Center Blog Status Jobs Terms Privacy Policy Cookies Ads info Brand Apps Advertise Marketing Businesses Developers Directory Settings © 2017 Twitter"]

texts.each do |t|
  p = Post.new(content: t[0..254])
  p.save
end
