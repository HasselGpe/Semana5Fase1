    datos1 = []
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
      puts "6º-Ingresa una direccion"
      direccion = gets.chomp
      datos1 << nombre << user << password << correo << telefono << direccion