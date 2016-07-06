require_relative 'Online_Store.rb'

class Controller

  def initialize
    @view = View.new
    @base_datos = Base_Datos.new
    page_inicio
  end 

  def page_inicio
    respuesta = @view.index
    opcion_usuario(respuesta)
  end

  def opcion_usuario(respuesta)
    if respuesta == "1"
      res = @view.type_user_register 
    if res == "1"
      obtencion_datos_cliente
    else 
      obtencion_datos_vendedor
    end 
  elsif respuesta == "2"
    login
  end
end 

  def registro_cliente
    datos = @view.obtencion_datos_cliente
    cliente = Cliente.new(datos[0], datos[2], datos[3])
    @base_datos.agregar_cliente(cliente)
    @view.registracion_exitosa
  end 

  def registracion_vendedor
    datos = @view.obtencion_datos_vendedor
    vendedor = Vendedor.new(datos[0], datos[2], datos[3])
    @base_datos.agregar_vendedor(vendedor)
    @view.registracion_exitosa
  end 

  def login 

    login = @view.login
    ingreso = @base_datos.login(login)
    p ingreso
    @view.resultado_login(ingreso)
  end 

end

Controller.new