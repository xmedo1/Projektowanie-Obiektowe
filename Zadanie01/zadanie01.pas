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
        tab[i] := Random(max - min + 1) + min; {fixed}
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

procedure unitTest();
var
    testTab: Tablica;
    i: Integer;
    passed: Boolean;
begin
    passed := True;
    {Test 1: Czy losowanie w zakresie}
    randomizer(testTab, 5, 15, 5);
    for i := 1 to 5 do
    begin
        if (testTab[i] < 5) or (testTab[i] > 15) then
            passed := False;
    end;

    {Test 2: Sortowanie posortowanej tablicy}
    testTab[1] := 1;
    testTab[2] := 2;
    testTab[3] := 3;
    bubbleSort(testTab, 3);
    if (testTab[1] <> 1) or (testTab[2] <> 2) or (testTab[3] <> 3) then 
        passed := False;

    {Test 3: Duplikaty}
    testTab[1] := 10;
    testTab[2] := 10;
    testTab[3] := 10;
    bubbleSort(testTab, 3);
    if (testTab[1] <> 10) or (testTab[2] <> 10) or (testTab[3] <> 10) then 
        passed := False;

    {Test 4: Jeden element}
    testTab[1] := 10;
    bubbleSort(testTab, 1);
    if (testTab[1] <> 10) then 
        passed := False;

    {Test 5: Sortowanie odwroconej tablicy}
    testTab[1] := 3;
    testTab[2] := 2;
    testTab[3] := 1;
    bubbleSort(testTab, 3);
    if (testTab[1] <> 1) or (testTab[2] <> 2) or (testTab[3] <> 3) then 
        passed := False;

    if passed then
        writeln('Wszystkie testy ukonczono pomyslnie.')
    else
        write('Blad w testach.');

end;


begin
    randomizer(liczby, 10, 50, 25);
    bubbleSort(liczby, 25);
    unitTest();
end.