# weather_app

Flutter ile yapılan hava durumu uygulaması

## Akış

  -Kullanıcı ilk defa giriş yapar anasayfada search dropdown ile karşılaşır.
  -Search ile il seçer ve hava durumu detay sayfasına yönledirir.
  -Detay sayfasında Rüzgar, nem sıcaklık gibi değerleri görür.
  -Eğer ekli değilse appbarda ekle iconu ile takip etmek istediği ili ekler.
  -Eğer ekli ise ekle iconu yerine close ikonu ile karşılaşır.
  -Yeni bir hava durumu ekleyip anasayfaya geldiğinde eklenen il ile karşılaşır.
  -Yeni eklenen hava durumlarında anasayfaya geldiğinde endpointe tekrardan istek atmadan state teki hava durumunu görür.
  -Kullanıcı app e tekrar giriş yaptı ve ekli bir il var ise endpointe istek atar ve ilgili havadurumlarını çeker ve kullanıcıya yansır.
  -Refreshindicator ile kullanıcı anasayfasındaki illerin hava durumlarını günceller.
  -Sola kaydırarak kullanıcı eklediği hava durumunu siler.

  ## Kullanılan plugin ve package

  http => endpoint isteklerinde kullanıldı.
  hive => localda tutulması gereken datalar için kullanıldı.
  google_fonts=>fontların düzenlenmesi için kullanıldı.
  get=> basit statelerde, navigationda, localizationda, dependency Injectionda kullanıldı.
  path_provider=>local pathlerin ayarlanması için kullanıldı.
  font_awesome_flutter=>iconlar için kullanıldı.
  dropdown_search=> city search field için kullanıldı.
  flutter_bloc=> state management için kullanıldı.
  animations => sayfa geçiş animasyonlarında kullanıldı.

  
  
  
  
  
  
  

  


