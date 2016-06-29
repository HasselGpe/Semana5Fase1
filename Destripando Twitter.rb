# Destripando Twitter

# Nos vamos a meter a las entrañas de la cuenta de twitter de una persona famosa.

# Crearemos un programa que obtenga el HTML de una cuenta de Twitter, extraiga información 
# relevante y la despliegue en la consola.

# En un ejercicio anterior habíamos representado la información paralelamente en CSV-land
#  y Ruby-land.

# En este ejercicio haremos algo parecido con HTML (HTML-land <=> Ruby-land). Esta vez lo 
# que vamos a hacer es convertir la infomación que nos interesa de un archivo de HTML en 
# objetos de Ruby para usarlos dentro de nuestro programa.

# Objetivos Académicos
# Familiarizarse con HTML y sus elementos.
# Conocer la función de las clases y id's dentro del HTML.
# Parsear documentos de HTML.
# Actividades
# Paso 1: Guardar una página de HTML
# Copia la url de tu cuenta de Twitter favorita (ej. https://twitter.com/CH14_)

# Desde la consola utiliza el siguiente comando para salvar el HTML en un archivo:

# $ curl `url` > twitter_account.html
# Abre el archivo que crea el comando anterior y échale un ojo.

# Paso 2: Nokogiri
# Vamos a usar la gema Nokogiri para parsear el archivo de HTML. Recuerda hacer require para 
# poder usar las funciones de Nokogiri.

# La siguiente línea usa Nokogiri para convertir el archivo de HTML del paso anterior a un 
# objeto de Ruby de tipo ??. Ejecútala desde irb y fíjate que tipo es.

# irb> doc = Nokogiri::HTML(File.open('twitter_account.html'))
# # ¿Qué clase tiene doc ?
# Del siguiente código, la primera línea es un método de Nokogiri que utiliza CSS selectors 
# para encontrar elementos específicos dentro del HTML. Modifica la parte del selector para
#  buscar diferentes elementos en el archivo.

# irb> profile_name = doc.search(".ProfileHeaderCard-name > a")
# irb> profile_name.first.inner_text
# Para este momento ya deberías entender como se usan las clases y los id's dentro del HTML 
# y CSS.

# No tengas miedo de jugar con ellos. Puedes abrir el archivo del paso 1 en Chrome y utilizar 
# el Inspector para husmear en su estructura.

# Compara los elementos de HTML contra los objetos de Nokogiri (HTML-land <=> Nokogiri-land).

# Paso 3: Con lo que aprendiste crea tu programa
# Toma como ejemplo el siguiente mock-up. Espero lo hagas mejor, no te limites:

# $ ruby twitter_scrapper.rb
# Username: Chicharito Hernandez
# ----------------------------------------------------------------------------
# Stats: Tweets: 734, Siguiendo: 298, Seguidores: 4,95M, Favoritos: 70
# ----------------------------------------------------------------------------
# Tweets: 
#   30 de mar.: Somos futbolistas unidos por una gran causa. Entendamos juntos al autismo 
#   @iluminemosazul https://www.youtube.com/watch?v=g3umuOWdMyA … #Iluminemosdeazul 
#   Retweets:862, Favorites:1,6K

#   30 de mar.: Felicidades churuuuuuu @SergioRamos que la pases
#    muy bien!!!  #top pic.twitter.com/ulhTMRk38V 
#   Retweets:2,6K, Favorites:5,3K

#   29 de mar.: Fe y confianza!!!... Muchísimas gracias por el gran apoyo
#    en LA!... #blessed pic.twitter.com/oOiEmYhKQt 
#   Retweets:3,3K, Favorites:7K
# Utiliza el siguiente esqueleto para armar tu programa:

# class TwitterScrapper
#   def initialize(url)
#   end

#   def extract_username
#   end

#   def extract_tweets
#   end

#   def extract_stats
#   end

# end
# Piensa que otras clases ayudarían a que tu programa quede mejor organizado y siguiendo 
# los principios de OOP.

# Paso 4: Haz dinámico tu programa
# Mejora tu programa para que se le pueda pasar la url de una cuenta de twitter desde la 
# consola. Como en el siguiente ejemplo:

# $ ruby twitter_scrapper.rb https://twitter.com/El_Brody
# Username: Jorge Campos
# ----------------------------------------------------------------------------
# Stats: Tweets: 7, Siguiendo: 1,128, Seguidores: 21.7K
# ----------------------------------------------------------------------------

# ...
# Para esto necesitarás la librería open-uri para traer la página web dinámicamente.

# require 'open-uri'

# html_file = open('https://twitter.com/El_Brody')
# puts html_file.read
#####################################################################################################################################################################################
require 'pp'  
require 'nokogiri'
require 'open-uri'
class Twitter
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end
  def profile_name
    profile_name = @doc.search(".ProfileHeaderCard-name > a")
    profile_name.first.inner_text
    "User Name: #{profile_name.first.inner_text}"
  end
  def stats
    # Ingresando al numero de tweets
    tweets = @doc.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-nav > span.ProfileNav-value")
    tweets = tweets.inner_text
    # Ingresando a valores de stats
    valores = @doc.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-openSignupDialog.js-nonNavigable.u-textUserColor > span.ProfileNav-value")
    following = valores.first.inner_text
    # Ingresando al indice de followers
    followers = valores[1].inner_text
    # Ingresando al indice de likes
    likes = valores[2].inner_text
    "Stats: Tweets: #{tweets} Siguiendo: #{following} Seguidores: #{followers} Likes: #{likes}"
  end
  def ultimos_tweets
    tweets = @doc.search(".js-tweet-text-container > p.TweetTextSize.TweetTextSize--16px.js-tweet-text.tweet-text")
    for i in 0..7
      puts "----------------------------------------------------------------------------"
      p tweets[i].inner_text
      retweets = @doc.search(".stream-container > div.stream > ol.stream-items.js-navigable-stream > li:nth-child(#{i + 1}).js-stream-item.stream-item.stream-item.expanding-stream-item > div.tweet.js-stream-tweet.js-actionable-tweet.js-profile-popup-actionable.original-tweet.js-original-tweet > div.content > div.stream-item-footer > div.ProfileTweet-actionList.js-actions > div.ProfileTweet-action.ProfileTweet-action--retweet.js-toggleState.js-toggleRt > button.ProfileTweet-actionButton.js-actionButton.js-actionRetweet > div.IconTextContainer > span.ProfileTweet-actionCount > span.ProfileTweet-actionCountForPresentation").inner_text  
      favorites = @doc.search(".stream-container > div.stream > ol.stream-items.js-navigable-stream > li:nth-child(#{i + 1}).js-stream-item.stream-item.stream-item.expanding-stream-item > div.tweet.js-stream-tweet.js-actionable-tweet.js-profile-popup-actionable.original-tweet.js-original-tweet > div.content > div.stream-item-footer > div.ProfileTweet-actionList.js-actions > div.ProfileTweet-action.ProfileTweet-action--favorite.js-toggleState > button.ProfileTweet-actionButton.js-actionButton.js-actionFavorite > div.IconTextContainer > span.ProfileTweet-actionCount > span.ProfileTweet-actionCountForPresentation").inner_text
      puts "retweets: #{retweets}    favorites: #{favorites} "
      
    end
  end
  def twitter_board
    puts "----------------------------------------------------------------------------"
    puts profile_name
    puts "----------------------------------------------------------------------------"
    puts stats
    puts "----------------------------------------------------------------------------"
    puts "Tweets:"
    ultimos_tweets
  end
end
profile = Twitter.new('https://twitter.com/HasselOrtegaP')
profile.twitter_board



















































# require 'net/http'
# require 'nokogiri'
#   def initialize(url) 
#     link = url[0]
#     @uri = URI(link)
#     page = Net::HTTP.get(@uri)
#     @doc = Nokogiri::HTML(page)
#     extract_username
#     extract_stats
#     extract_tweets
#   end
#   def extract_username
#     profile_name = @doc.search(".ProfileHeaderCard-name > a")
#     puts "Username: #{profile_name.first.inner_text}"
#   end
#   def extract_tweets
#     tweets = @doc.search(".tweet")
#     puts "Tweets"
#     likes = ""
#     tweets.pop
#     tweets.each do |tweet|
#       date = tweet.css("span._timestamp.js-short-timestamp").inner_text
#       post = tweet.css(".js-tweet-text-container").inner_text
#       retweets = tweet.css(".ProfileTweet-actionCountForPresentation").first.text
#       likes = tweet.css(".ProfileTweet-actionCountForPresentation").last.text
#       puts "\t#{date}: #{post}\n Retweets: #{retweets}, Favorites:#{likes}"
#     end
#     puts "-" * 80
#   end
#   def extract_stats
#     data = @doc.search(".ProfileNav-value")
#     stats = []
#     for i in 0..data.length - 1
#       stats << data[i].inner_text
#     end 
#     puts "Stats: Tweets: #{stats[0]}, Siguiendo: #{stats[1]}, Seguirdores: #{stats[2]}, Favoritos: #{stats[3]} \n"
#   end
# end
# link = ARGV
# prueba = TwitterScrapper.new(link)
