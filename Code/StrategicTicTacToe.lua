--StrategicTicTacToe.lua
stdnumbers = {
     --map34
    {2,1,3,6,5,4,7,9,8},
    {3,2,1,4,6,5,8,7,9},
    {1,3,2,5,4,6,9,8,7}
}

example1 = {
--graph1
    {2,8,5,5,2,8,8,5,2},
    {3,9,6,6,3,9,9,6,3},
    {4,1,7,7,4,1,1,7,4}
}

--Смешивающие комбинации
numbers = {
   --map48
    {3,1,2,6,5,4,9,7,8},
    {1,2,3,4,6,5,7,8,9},
    {2,3,1,5,4,6,8,9,7}
}
--Будущая 1/3 матрицы смежности графа
_mapping = {}
for i = 1,9 do
    _mapping[i] = {}
    for j = 1,27 do
        _mapping[i][j] = 0
    end
end
--Расчёт матрицы смежности
for k = 1,3 do --Номер поля
    for i = 1,3 do --Номер триплета поля
        for j = 1,3 do --Номер строки в триплете
            -- (i-1)*3 + j - номер строки в поле
            -- (k-1)*3+i - общий номер триплета для "ИЗ"
            -- (numbers[k][(i-1)*3 + j]-1)*3 + j - общий номер триплета для "B"
            _mapping[(k-1)*3+i][(numbers[k][(i-1)*3 + j]-1)*3 + j] = 1
        end
    end
end
--Вывод 1/3 матрицы смежности
for i = 1,9 do io.write(table.concat(_mapping[i]," ").."\n")end
--Выводим матрицу в файл
h = io.open("StrategicTicTacToe.csv", "w+")
for k = 1,3 do
    for i = 1,9 do
        for j = 1,27 do
            if _mapping[i][j] == 1 then
                h:write("1;")
            else
                h:write(";")
            end
        end
        h:write(((k-1)*9+i).."\n")
        h:flush()
    end
end
h:write(";\n")
h:flush()
--Создаём полную матрицу смежности копируя исходную три раза
_matrix = {}
_buff= {}
for k = 1,3 do
    for i = 1,9 do
        for j,v in ipairs(_mapping[i]) do
            if (v == 0) and (k-1)*9+i ~= j then
                --Заменяем отсутсвующие рёбра на ОЧЕНЬ длинные
                --Все, кроме рёбер (j,j)
                table.insert(_matrix, 30000000)
            elseif (k-1)*9+i == j then
                --Для рёбер (j,j)
                table.insert(_matrix, 0)
                --Сохраняем рёбра (j,j)
                table.insert(_buff, v)
            else
                table.insert(_matrix, v)
            end
        end
    end
end
--Проходимся алгоритмом Флойда
for k = 1,27 do
    --print(math.floor(k/27 * 100))
    for i = 1,27 do
        for j = 1,27 do
            _matrix[(i-1)*27+j] = math.min(_matrix[(i-1)*27+j], _matrix[(i-1)*27+k] + _matrix[(k-1)*27+j])
        end
    end
end
--Выводим матрицу расстояний в файл 
for i=1,27 do
    for j=1,27 do
        h:write(_matrix[(i-1)*27+j]..";")
    end
    h:write("\n")
end
h:write(";\n")
h:flush()
--Увеличим длинну рёбер (j,j), при условии что они изначально сами в себя не отсылают
for i = 1,27 do
    if _buff[i] == 0 then
        _matrix[(i-1)*27+i] = 300000000
    end
end
--[[
    Проходимся алгоритмом Флойда ещё раз 
    для нахождения минимального пути для 
    вершины из себя в себя(собственный путь)
]]
for k = 1,27 do
    for i = 1,27 do
        for j = 1,27 do
            _matrix[(i-1)*27+j] = math.min(_matrix[(i-1)*27+j], _matrix[(i-1)*27+k] + _matrix[(k-1)*27+j])
        end
    end
end
--Выводим собственные пути отдельной строкой
for i = 1,27 do
    h:write(_matrix[(i-1)*27+i]..";")
end
h:write("\n;\n")
for i = 1,27 do
    h:write(i..";")
end
h:write("\n;\n")
h:flush()
h:close()
--[[
    Как получить HeatMap:
    Ctrl+A Главная -> Формат -> Ширина столбца... -> 3
    В A61: =ЕСЛИ(A$59 = $AB1;A$57;A29)
    Растянуть из А61 до АА61
    Растянуть полученое до 87
    Главная -> Условное форматирование -> Цветовые шкалы -> Первая шкала
]]