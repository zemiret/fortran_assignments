# Budowanie
Aby zbudowć kod, najlepiej odpalic `./build.sh`

# Wyniki

## kind = 4
<object data="https://github.com/zemiret/fortran_assignments/raw/master/assignments/zad1/res/wykres4.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/zemiret/fortran_assignments/raw/master/assignments/zad1/res/wykres4.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="http://yoursite.com/the.pdf">Download PDF</a>.</p>
    </embed>
</object>

## kind = 8
<object data="https://github.com/zemiret/fortran_assignments/raw/master/assignments/zad1/res/wykres8.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/zemiret/fortran_assignments/raw/master/assignments/zad1/res/wykres8.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="http://yoursite.com/the.pdf">Download PDF</a>.</p>
    </embed>
</object>

## kind = 16
<object data="https://github.com/zemiret/fortran_assignments/raw/master/assignments/zad1/res/wykres16.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/zemiret/fortran_assignments/raw/master/assignments/zad1/res/wykres16.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="http://yoursite.com/the.pdf">Download PDF</a>.</p>
    </embed>
</object>

# Wnioski

Jak widać na powyższych wykresach, wbudowana funkcja `matmul` zawsze jest
najszybsza ze wszystkich.
Funkcje `naiwna` i `ulepszona` produkują praktycznie taki sam rezultat dla
precyzji równej 4 i 8, z czego można wnioskować, że wektoryzacja kolumn w pamięci nie była specjalnie efektywna.
Jednak dla precyzji równej 16, funkcja `ulepszona` jest już zauważalnie szybsza.
Funkcja `dot` jest gorsza niż `matmul`, jednak wciąż lepsza niż którakolwiek z
całkowicie ręcznie napisanych.
Wniosek: Kiedy się da, należy korzystać z funkcji wbudowanych, ponieważ zawierają
optymalizacje i są najszybsze.

# Sidenote
(Przepraszam za podwojony wykres dla real(kind = 16). Gnuplot zwariował)

