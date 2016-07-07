# Browser Pirata

# Este ejercicio buscará que comprendas las funcionalidades básicas de un navegador y te vayas familiarizando con el protocolo que usan para comunicarse los sitios web (HTTP).

# ¿Sabes realmente cómo funciona un browser?


# Pasos que realiza un browser para regresarte una página web:

# Usuario especifica la url.
# Browser hace un http request.
# Browser recibe un http response (información).
# Browser procesa la información.
# Browser despliega la información con un formato amigable.
# En este ejercicio crearemos un programa que realice todas estas actividades. Vamos a utilizar la librería Net::HTTP para traer la página y Nokogiri para parsear el HTML que regresa el servidor.

# Investiga como funciona el método de NET::HTTP => .get_response
# Objetivos Académicos
# Conocer cómo funciona un browser.
# Familiarizarse con el protocolo HTTP.
# Conocer la estructura de HTML y sus selectores.
# Actividades
# Recuerda antes de empezar, hacer los requires necesarios para poder usar Net::HTTP y Nokogiri.

# Nuestro programa funcionará de la siguiente manera:

# url> http://www.codea.mx
# Fetching...
# Título: CodeaCamp
# Links:
#   Home: /
#   Preguntas Frecuentes: /static_pages/faq
#   Trabajo: /static_pages/work
#   Empresas: /static_pages/employers
#   Escríbenos: /contacts/new
# ...
# url>
# Paso 1: Crear la clase Page
# La clase Page tendrá los siguientes métodos:

# class Page
#   def initialize(url)
#   end

#   def fetch!
#   end

#   def links
#   end

#   def title
#   end
# end
# Responsabilidades de la clase:

# Recibe una url al crearse.
# Sabe hacer un http request y guarda la respuesta para usarse en otros métodos.
# Regresa un array de los links de la página (texto/url).
# Regresa el título de la página.
# Paso 2: Crear el Browser
# La clase Browser es la que controlará tu programa.

# class Browser
#   def run!
#   end
# end

# Browser.new.run!
# Piensa en cómo conocerás la url que el usuario quiere.
# ¿Cómo corres tu programa y cómo el usuario interactúa con él?
# ¿Qué información está esperando ver desplegada?

# Paso 3: Extras
# Haz que tu programa sea dinámico.
# Que el usuario pueda dar diferentes url's sin tener que correrlo cada vez.
# Que el usuario pueda escoger alguno de los links que muestras como su próxima url.
# Y que puedan cerrar el programa cuando guste.

# De aquí en adelante te reto a que le añadas las funcionalidades que tu imaginación alcance.
####################################################################################################################################################################################
require 'net/http'
require 'nokogiri'
class Page
  attr_reader :url
  attr_accessor :argv
  def initialize(url:)
    @url = url
  end
  def fetch!
    res = Net::HTTP.get_response(URI(@url))
     @a = res.body    
  end
  def title
    @doc = Nokogiri::HTML(fetch!)
    profile_name = @doc.search("title")
    profile_name.inner_text
  end
  def links
    profile_name = @doc.search(".nav.navbar-nav > li")
    @links = profile_name.css('a').collect{|x| x["href"]}
  end
end
class Browser 
  attr_accessor :argv, :answer
  def run!
    puts ""
    puts "Pagina a buscar wwww.codea.mx"
    puts ""
    print "Dirección web en la que puedes Entrar:"
    $argv = "http://" + gets.chomp.downcase
    page = Page.new(url: $argv)
    puts "url> #{page.url}"
    puts "Título: #{page.title}"
    puts "Links: "
    puts "  Home: #{page.links[2]}"
    puts "  Preguntas Frecuentes: #{page.links[3]}"
    puts "  Blog: #{page.links[4]}"
    puts "  Precios: #{page.links[5]}"
    puts "  Escríbenos: #{page.links[6]}"
    puts "Contenido: "
    puts " "
    puts "Preciona [S] Salir del Browser"
    puts "Preciona [V] para volver a reiniciar la busqueda"
    $answer = gets.chomp.upcase
  end
end
browser = Browser.new
browser.run!
case $answer
 when "S" then exit
 when "V" then browser.run!
end



































