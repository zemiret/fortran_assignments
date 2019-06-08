# Kompilacja 
Dostępne są różne opcje kompilacji, które wykorzystują różne tryby
flagi coarray.

```
make # default
make shared # -coarray=shared
make distributed # -coarray=distributed
make single # -coarray=single
```

# Uruchomienie:
```
./main.out
```

# Realizacja zadania:
Program po kolei uruchamia wszystkie opcje całkowania dla każdej z
zadanych funkcji. Coarray wykorzystane są do zrównoleglenia
całkowania po danym obszarze poprzez podział go na części, a następnie zsumowanie
wyników.

# Wyniki
## Dokładność
W znakomitej większości, wyniki kwadratury Gaussa są najdokładniejsze ze
wszystkich trzech, co zgadza się z intuicją.
Poniżej zmieszczony został wynik działania programu, który
opisuje rezultat każdego wywołania oraz jego błąd bezwzględny.

```
 Function    result    error
 sin, sq :    1.00000005782963       5.782963130585017E-008
 sin, trap :   0.999999955731203      -4.426879662844385E-008
 sin, gauss :    1.00000000000106       1.061817300751500E-012

 exp, sq :    6.38905603237781       3.237780887843655E-008
 exp, trap :    6.38905623203582       2.320358172269721E-007
 exp, gauss :    6.38905609891343       9.891342767076594E-008

 poly1, sq :    1.99999999999996      -4.085620730620576E-014
 poly1, trap :    1.99999999999996      -4.085620730620576E-014
 poly1, gauss :    1.99999999999478      -5.216715948108686E-012

 poly2, sq :    12.6666664999995      -1.666671423095067E-007
 poly2, trap :    12.6666669999995       3.333328510990441E-007
 poly2, gauss :    12.6666666666447      -2.197886317389930E-011

 poly3, sq :    36.6666657499981      -9.166686041339744E-007
 poly3, trap :    36.6666684999981       1.833331417344652E-006
 poly3, gauss :    36.6666666666318      -3.488054289846332E-011

 poly4, sq :    43.0666654166642      -1.250002434005637E-006
 poly4, trap :    43.0666691666642       2.499997542315668E-006
 poly4, gauss :    43.0666666666347      -3.197442310920451E-011

 poly5, sq :    64.3999970833288      -2.916671206776300E-006
 poly5, trap :    64.4000058333288       5.833328771132074E-006
 poly5, gauss :    64.3999999999980      -2.032152224273887E-012

 poly6, sq :    174.114270797602      -1.491668388098333E-005
 poly6, trap :    174.114315547601       2.983331512496079E-005
 poly6, gauss :    174.114285714537       2.516742370062275E-010

 poly7, sq :    398.114238130906      -4.758338013743924E-005
 poly7, trap :    398.114380880900       9.516661452835251E-005
 poly7, gauss :    398.114285715250       9.645759746490512E-010

 poly8, sq :    511.891994575333      -6.891673007203281E-005
 poly8, trap :    511.892201325324       1.378332605099786E-004
 poly8, gauss :    511.892063493485       1.421483375452226E-009

 poly9, sq :    614.291970575317      -9.291674632549984E-005
 poly9, trap :    614.292249325302       1.858332389019779E-004
 poly9, gauss :    614.292063493978       1.914941094582900E-009

 poly10, sq :    986.655500272223      -1.995834765011750E-004
 poly10, trap :    986.655746130975       4.627527539469156E-005
 poly10, gauss :    986.655699859696       3.995864972239360E-009
```

## Czas
Zmierzony został czas działania programu dla różnych opcji kompilacji
flagi coarray.

Aby uruchomić mierzenie czasów wywołań:
```
./bench.sh
```

**Rezultat:**

Nie zaobserwowano drastycznych różnic w czasach działania.
Zazwyczaj jednak opcja 'shared' sprawdza się najgorzej 
(co może jednakowoż być spowodowane jedynie kolejnością wywołań,
ponieważ różnice są małe, ciężko stwierdzić czy faktycznie działa gorzej). 

