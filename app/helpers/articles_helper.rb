module ArticlesHelper

def getUserName(user_id)
  user = User.find_by(id: user_id)
  user ? user.username : "Anonyme"
end
end
