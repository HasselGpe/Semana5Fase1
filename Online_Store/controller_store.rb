require_relative 'model_store.rb'
require_relative 'view_store.rb'
class MainController

  def initialize
    @view = View.new
    @base_datos = BaseDatos.new
    pagina_inicio
  end

  def pagina_inicio
    respuesta = @view.index
    opcion_usuario(respuesta)
  end

  def opcion_usuario(respuesta)
    if respuesta == "1"
      r = @view.tipo_usuario
      if r == "1"
        registro_cliente
      else
        registro_vendedor
      end
    elsif respuesta == "2"
      login
    end
  end

  def registro_cliente
    datos = @view.pide_datos
    cliente = Cliente.new(datos[0], datos[1], datos[2], datos[3])
    @base_datos.agregar_cliente(cliente)
    @view.registro_exitoso
  end

  def registro_vendedor
    datos = @view.pide_datos_v
    vendedor = Vendedor.new(datos[0], datos[1], datos[2], datos[3], datos[4], datos[5])
    @base_datos.agregar_vendedor(vendedor)
    @view.registro_exitoso
  end

  def login
    login = @view.login
    ingreso = @base_datos.login(login)
    p ingreso
    @view.resultado_login(ingreso)
  end

end


MainController.new


