class User < ActiveRecord::Base
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')

  def self.authenticate(email, password)
  user = User.find_by(email: email)
    if user
      if user.password == password && user.email == email
        user
      else
        nil
      end
    end
  end
  
end