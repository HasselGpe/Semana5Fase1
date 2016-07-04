require 'csv'
require 'pp'

class User

   attr_accessor :nombre, :usuario, :password, :correo

  def initialize(nombre, usuario, password, correo)
    @nombre = nombre
    @usuario = usuario
    @password = password
    @correo = correo
  end

end

class Cliente < User

end


class Vendedor < User

  attr_accessor :producto, :stock

  def initialize(nombre, usuario, password, correo, producto, stock)
    super(nombre, usuario, password, correo)
    @producto = producto
    @stock = stock
  end

end


class BaseDatos

  def agregar_cliente(cliente)
     tareas = []
    CSV.foreach('clientes.csv') do |tarea|
      tareas << tarea
    end
    
    num = tareas.length 

    CSV.open('clientes.csv', 'a+') do |csv|
      csv << [num + 1, cliente.nombre, cliente.usuario, cliente.password, cliente.correo ]
    end
  end

  def agregar_vendedor(vendedor)
    vendedores = []
    CSV.foreach('vendedores.csv') do |vendedor|
      vendedores << vendedor
    end
    
    num = vendedores.length 

    CSV.open('vendedores.csv', 'a+') do |csv|
      csv << [num + 1, vendedor.nombre, vendedor.usuario, vendedor.password, vendedor.correo, vendedor.producto, vendedor.stock]
    end
  end

  def login(array)
    usuario = array[0]
    pass = array[1]
    n = 0

     CSV.foreach('clientes.csv') do |cliente|
      if usuario == cliente[2]
        n += 1
      end
      if pass == cliente[3]
        n += 1
      end
    end

    CSV.foreach('vendedores.csv') do |vendedor|
      if usuario == vendedor[2]
        n += 1
      end
      if pass == vendedor[3]
        n += 1
      end
    end
    n
  end

end
