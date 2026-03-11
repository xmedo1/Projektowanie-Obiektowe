program Generator;

type
    Tablica = array[1..50] of Integer;
var
    liczby: Tablica;

procedure randomizer(var tab: Tablica; min, max, count: Integer);
var
    i: Integer;
begin
    Randomize;
    if count > 50 then
    begin
        count := 50;
    end;

    for i := 1 to count do
    begin
        tab[i] := Random(max - min)+1;
    end;
    writeln('Wygenerowano ', count, ' losowych liczb z zakresu od ', min, ' do ', max, '.');
end;

procedure bubbleSort(var tab: Tablica; count: Integer);
var
    i, j, temp: Integer;
begin
    for i := 1 to count-1 do
    begin
        for j := 1 to count-i do
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
    randomizer(liczby, 10, 50, 25);
    bubbleSort(liczby, 25);
end.