class View

  def index
    puts "Welcome to the online store"
    puts "Store: Crea tu playera, (www.crea-tu-playera.com) "
    puts "-----------------------------------------------"
    puts "Selecciona una opcion(numero)"
    puts "-----------------------------------------------"
    puts "1. Registrate"
    puts "2. Login"
    puts "3. Administrador"
    puts "4. Exit"
    respuesta = gets.chomp
  end

  def tipo_usuario
    # sleep 1
    puts "Como que tipo de usuario deseas registrarte"
    # sleep 0.7
    puts "1. Cliente"
    puts "2. Vendedor"
    respuesta = gets.chomp
  end

  def pide_datos
    datos = []
    puts "Para realizar el registro necesitamos los siguientes datos"
    puts "Nombre y apellidos?"
    nombre = gets.chomp
    puts "Nombre de usuario?"
    usuario = gets.chomp
    puts "Contraseña?"
    pass = gets.chomp
    puts "Correo?"
    correo = gets.chomp
    datos << nombre << usuario << pass << correo
  end

  def pide_datos_v
    datos = []
    puts "Para realizar el registro necesitamos los siguientes datos"
    puts "Nombre y primer apellido?"
    nombre = gets.chomp
    puts "Nombre de usuario?"
    usuario = gets.chomp
    puts "Contraseña?"
    pass = gets.chomp
    puts "Correo?"
    correo = gets.chomp
    puts "Nombre del producto que deseas?"
    producto = gets.chomp
    puts "Cantidad de stock?"
    stock = gets.chomp
    datos << nombre << usuario << pass << correo << producto << stock
  end

  def registro_exitoso
    puts 
    print "Registrandote"
    sleep 1
    print "."
    sleep 1
    print "."
    sleep 1
    print "."
    sleep 0.7
    puts "Felicidades tu registro ha sido exitoso"
    puts "Ahora ingresa en login para conocer todo los beneficios que Crea tu playera te puede ofrecer"
  end

  def login
    login = []
    sleep 0.7
    puts "Login   -  Nokogiri.com"
    puts "----------------------------------------"
    puts "Ingresa tu Usuario:"
    usuario = gets.chomp
    puts "Ingresa tu Contraseña:"
    pass = gets.chomp
    login << usuario << pass
  end

  def resultado_login(acceso)
      p "Bienvenido a Crea tu playera (www.crea-tu-playera.com)"
  end

end







