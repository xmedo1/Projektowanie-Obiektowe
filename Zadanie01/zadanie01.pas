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

procedure bubbleSort(var tab: Tablica);
var
    i, j, temp: Integer;
begin
    for i := 1 to 50-1 do
    begin
        for j := 1 to 50-i do
        begin
            if tab[j] > tab[j+1] then
            begin
                temp := tab[j];
                tab[j] := tab[j+1];
                tab[j+1] := temp;
            end; 
        end;
    end;
    writeln('Posortowano.');
end;

begin
    randomizer(liczby);
    bubbleSort(liczby);
end.