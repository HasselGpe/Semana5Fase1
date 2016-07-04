# Browser Pirata
# Este ejercicio buscará que comprendas las funcionalidades básicas de un navegador y 
# te vayas familiarizando con el protocolo que usan para comunicarse los sitios web (HTTP).
# ¿Sabes realmente cómo funciona un browser?
# Pasos que realiza un browser para regresarte una página web:
# Usuario especifica la url.
# Browser hace un http request.
# Browser recibe un http response (información).
# Browser procesa la información.
# Browser despliega la información con un formato amigable.
# En este ejercicio crearemos un programa que realice todas estas actividades. Vamos 
# a utilizar la librería Net::HTTP para traer la página y Nokogiri para parsear el HTML 
# que regresa el servidor.
# Investiga como funciona el método de NET::HTTP => .get_response
# Objetivos Académicos
# Conocer cómo funciona un browser.
# Familiarizarse con el protocolo HTTP.
# Conocer la estructura de HTML y sus selectores.
# Actividades
# Recuerda antes de empezar, hacer los requires necesarios para poder usar Net::HTTP y 
# Nokogiri.
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
#####################################################################################################################################################################################
require 'net/http'
require 'nokogiri'
class Browser
  def initialize(url)
    link = url[0]
    @uri = URI(link) 
    page = Net::HTTP.get(@uri)
    @doc = Nokogiri::HTML(page)
  end
  def run!
    fetch!
    sleep 1.8
    title
    show_content
  end
  def fetch!
    puts "Fetching..."
  end 
  def links
    @links = @doc.css("nav a")
    @references_new = @doc.css("nav a").map{|url| url["href"]}
    @links_array = []
    @links.each{|text| @links_array << text }
  end
  def show_content
    links
    puts "\t#{@links_array[2].inner_text}: #{@references_new[2]} \n \t#{@links_array[3].inner_text}: #{@references_new[3]} \n \t#{@links_array[4].inner_text}: #{@references_new[4]} \n \t#{@links_array[5].inner_text}: #{@references_new[5]}\n \t#{@links_array[6].inner_text}: #{@references_new[6]}"
  end
  def title
    title_page = @doc.search("title")
    puts "Titulo: #{title_page.inner_text}"
  end
end
Browser.new(ARGV).run!






















