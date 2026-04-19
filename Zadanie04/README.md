**Zadanie 4** Wzorce strukturalne

Echo (Go)
Należy stworzyć aplikację w Go na frameworku echo. Aplikacja ma mieć
jeden endpoint, minimum jedną funkcję proxy, która pobiera dane np. o
pogodzie, giełdzie, etc. (do wyboru) z zewnętrznego API. Zapytania do
endpointu można wysyłać w jako GET lub POST.

:white_check_mark: 3.0 Należy stworzyć aplikację we frameworki echo w j. Go, która będzie miała kontroler Pogody, która pozwala na pobieranie danych o pogodzie (lub akcjach giełdowych) [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/c79e5a9b6e6991134783e8a441e8fa786d0a9142)] \
:white_check_mark: 3.5 Należy stworzyć model Pogoda (lub Giełda) wykorzystując gorm, a dane załadować z listy przy uruchomieniu [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/eac60d1d4917446b65a7d3134ea01dda6db38731)] \
:white_check_mark: 4.0 Należy stworzyć klasę proxy, która pobierze dane z serwisu zewnętrznego podczas zapytania do naszego kontrolera [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/fbe72261654cbeba33c2833ae977eab7128fdcbf)] \
:white_check_mark: 4.5 Należy zapisać pobrane dane z zewnątrz do bazy danych [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/bd53ef412b45f21d15c55ad8b72e35fce81f1a5c)] \
:x: 5.0 Należy rozszerzyć endpoint na więcej niż jedną lokalizację (Pogoda), lub akcje (Giełda) zwracając JSONa
