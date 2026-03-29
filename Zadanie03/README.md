**Zadanie 3** Wzorce kreacyjne

Spring Boot (Kotlin)
Proszę stworzyć prosty serwis do autoryzacji, który zasymuluje
autoryzację użytkownika za pomocą przesłanej nazwy użytkownika oraz
hasła. Serwis powinien zostać wstrzyknięty do kontrolera (4.5).
Aplikacja ma oczywiście zawierać jeden kontroler i powinna zostać
napisana w języku Kotlin. Oparta powinna zostać na frameworku Spring
Boot. Serwis do autoryzacji powinien być singletonem.

:white_check_mark: 3.0 Należy stworzyć jeden kontroler wraz z danymi wyświetlanymi z listy na endpoint’cie w formacie JSON - Kotlin + Spring Boot [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/82aec7c651ba9e9120d997276606d8949bf42e81)] \
:white_check_mark: 3.5 Należy stworzyć klasę do autoryzacji (mock) jako Singleton w formie eager [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/2f7b355a855dd25966bd1cd17768ab2b3553f2cd)] \
:white_check_mark: 4.0 Należy obsłużyć dane autoryzacji przekazywane przez użytkownika [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/4bb951d09700063d0b3c728621f1ff1b8b8384b9)] \
:white_check_mark: 4.5 Należy wstrzyknąć singleton do głównej klasy via @Autowired lub kontruktor (constructor injection) [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/4bb951d09700063d0b3c728621f1ff1b8b8384b9)] \
:white_check_mark: 5.0 Obok wersji Eager do wyboru powinna być wersja Singletona w wersji lazy [[commit](https://github.com/xmedo1/Projektowanie-Obiektowe/commit/1d0b0d1b68e3301577a31ed3b9addb31e485534a)]
