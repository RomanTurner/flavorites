class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :followers, :following
  
  def followers
    object.followers.map do |follower|
      { id: follower.id, 
        username: follower.username,} 
    end
  end 
  
  def following
    object.following.map do |follower|
       { id: follower.id, 
        username: follower.username,}  
    end 
  end 

end
