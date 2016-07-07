require 'cvs'

class User

  attr_accessor :nombre, :user, :password, :correo, :direccion, :telefono
  def initilize(nombre, user, password, correo, direccion, telefono)
      @nombre = nombre
      @user = user
      @password = password 
      @correo = correo
      @direccion = direccion
      @telefono = telefono
  end 
end 

class Cliente < User

end 

class Vendedor < User
   attr_accessor :producto :stock
   

end 