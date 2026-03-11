program Generator;

type
    Tablica = array[1..50] of Integer;
var
    liczby: Tablica;

procedure randomizer(var tab: Tablica);
var
    i: Integer;
begin
    Randomize;
    for i := 1 to 50 do
    begin
        tab[i] := Random(100)+1;
    end;
    writeln('Wygenerowano 50 losowych liczb.')
end;

begin
    randomizer(liczby);
end.