# Online Store

# Vamos a crear una interfase para una tienda en línea. Este será el programa más 
# complejo que habrás creado hasta ahora. Deberá tener como componentes una tienda, 
# sus productos y tres tipos de usuarios: administradores, vendedores y clientes.

# En este ejercicio tú decidirás como diseñar el programa, no te daremos muchas 
# indicaciones. Para ello deberás de planear tu programa adecuadamente. Utiliza un 
# pizarrón o papel y discute con tu pareja que deberá tener el programa y como será su flujo.

# Objetivos Académicos
# Practicar:

# Programación orientada a objetos
# Herencia
# Información y métodos privados vs públicos
# Scope
# Lógica y Flujo del código
# Actividades
# Pasos básicos:
# Primero crea una clase para la tienda
# Crea los productos de la tienda
# Crea los diferentes tipos de usuarios
# Crea un sistema de autentificación para los usuarios
# Define que operaciones puede realizar cada tipo de usuario y como afecta el flujo
# Deja volar tu imaginación y crece tu programa
# Pregúntate:
# Como manejarás los siguientes conceptos (privado vs público y scope)
# Que clases pueden heredar de otras para simplificar tu programa
# Que atributos necesitará cada clase
# Como puedes guardar los productos y usuarios en la tienda.
# Un ejemplo de como podría verse la interfase
# Welcome to the online store: Crea tu playera, (www.crea-tu-playera.com) 
# ----------------------------------------------------------------------
# Select option number:
# 1. Login
# 2. Register
# 3. Exit
# => 1

# Email:
# => admin@email.com

# Password:
# => password

# Welcome Administrador. Your type is Admin.
# ----------------------------------------------------------------------
# Select option number:
# 1. Logout
# 2. Products index
# 3. Create product
# 4. Users index

# ...
#####################################################################################################################################################################################
class vista

   def index

    puts "Welcome to the online"
    puts "Store:Crea tu playera, (www.crea-tu-playera.com)"
    puts "*************************************************"
    puts "Select option number:                           |"
    puts "*************************************************"
    puts "1º Register"
    puts "2º Login"
    puts "3º Administrador"
    puts "3º Exit"
    repuesta = gets.chomp

   end 

   def type_user_register

      puts "\t Registracion Paso 1"
      puts "¿Que usuario desea registrar"
      puts "1º Cliente"
      puts "2º Vendedor"
      respuesta = gets.chomp

   end

   def obtencion_datos_cliente

      datos1 = []
      puts "\t\t  Registracion Paso 2"
      puts "Para completar el registro favor de llenar los siguientes datos"
      puts "1º-Ingresa tu nombre completo"
      nombre = gets.chomp
      puts "2º-Nombre de usurio"
      user = gets.chomp
      puts "3º-Ingresa una contraseña"
      password = gets.chomp
      puts "4º-Ingresa un correo"
      correo = gets.chomp
      puts "5º-Ingresa un numero telefonico"
      telefono = gets.chomp
      puts "6º-Ingresa una direccion"
      direccion = gets.chomp
      datos1 << nombre << user << password << correo << telefono << direccion

   end
  def obtencion_datos_vendedor

      datos2 = []
      puts "\t Registracion Paso 2"
      puts "Para completar el registro favor de llenar los siguientes datos"
      puts "1º-Ingresa tu nombre completo"
      nombre = gets.chomp
      puts "2º-Nombre de usurio"
      user = gets.chomp
      puts "3º-Ingresa una contraseña"
      password = gets.chomp
      puts "4º-Ingresa un correo"
      correo = gets.chomp
      puts "5º-Ingresa un numero telefonico"
      telefono = gets.chomp
      datos2 << nombre << user << password << correo << telefono 

   end

   def registracion_exitosa

    print "Registrandote."
    sleep 2
    print ".."
    sleep 1
    print ".."
    sleep 0.7
    puts "."
    puts "Felicidades tu registro ha sido completado"

   end

   def login 

    login = []
    sleep 1
    puts "Login - www.crea-tu-playera.com"
    puts "*************************************************"
    puts "Ingresa tu usuario:"
    user = gets.chomp 
    puts "Ingresa tu contraseña"
    password = gets.chomp
    login << user << password

   end
    
    def res_login(access)
      puts "Bienvenido a Crea tu playera ( www.crea-tu-playera.com)"
      puts "Sigue disfurtando de las ventajas de ser miembro....."
    end
end










