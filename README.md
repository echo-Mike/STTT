# STTT
**STTT** stands for **S**tarategic **T**ic-**T**ac-**T**oe and represent an interesting game for two person.
STTT is a superset game of [Ultimate Tic-Tac-Toe](https://en.wikipedia.org/wiki/Ultimate_tic-tac-toe) same way as Ultimate Tic-Tac-Toe is a superset of [Ordinary Tic-Tac-Toe](https://en.wikipedia.org/wiki/Tic-tac-toe).
It have similar set of rulse but it's more complicated. The purpose of the game is to develop the strategic thinking of players, same as Ultimate Tic-Tac-Toe develops tactical thinking.  
### The terms
In the next sections the terms _Ultimate_ and _Tactical_ are equivalents.  
The _Cell_ - the place to put X or O, also an _Operational Cell_.  
The _Operational field_ - gamefield of Ordinary Tic-Tac-Toe, also a _Tactical Cell_ - 3x3 grid of Cells.  
The _Tactical gamefield_ - gamefield of Tactical Tic-Tac-Toe, also a _Strategic Cell_ - 9x9 grid of Cells, 3x3 grid of Tactical Cells.  
The _Strategic gamefield_ - gamefield of Strategic Tic-Tac-Toe - 27x27 grid of Cells, 9x9 grid of Tactical Cells, 3x3 grid of Strategic Cells.  
The _Tactical level_ - a game of Tactical Tic-Tac-Toe - interactions between Cells and Tactical Cells, win conditions and limits.  
The _Strategic level_ - a game of Strategic Tic-Tac-Toe represented as Tactical level - interactions between Tactical Cells and Strategic Cells, win conditions and limits .  
The _Current Move Cell_ - the Cell in witch current player place X or O.

## Game rules
Game have three rullsets: _Tactical-like_, _Map-like_  and _Hypermap-like_  
All rulesets are based on Tactical Tic-Tac-Toe ruleset so firstly let me remind you of it (currently on Russian).  
Правила состоят из трёх частей: правила хода, правила выигрыша, ограничения.  
Правила хода: (move rules)
* Первый ход совершает игрок Х в любую из 81 свободной ячейки.
* Каждый следующий ход определяется предыдущим следующим образом: следующий игрок должен ходить в ту тактическую ячейку, которая в тактичееском поле имет тоже положение, что и оперативная ячейка в оперативном поле в которую сходил текущий игрок.  

Правила выигрыша:  (win rules)
* Тактическая клетка может иметь четыре игровых состояния: Игра, Победил Х, Победил О, Ничья. Состояние Ничья считается и за Х и за О.
* Выигрывает тот игрок, который побеждает по правилам Обычных крестиков ноликов на тактичееском поле.  

Ограничения:  (limits)
1. Тактическая клетка может иметь два состояния заполнения: Есть места, Заполнена.
2. Если ход игрока должен произойти в тактическую клетку с состоянием заполнения Заполнена , то игрок может сделать ход в любую клетку. 
    * Опциональное ограничение: Если ход игрока должен произойти в тактическую клетку с игровым состоянием не Игра , то игрок может сделать ход в любую клетку.
3. Опциональное ограничение: Нельзя направлять следующего игрока в тактическую клетку, где он произвёл педыдущий ход.
4. Ни кто не может выиграть линией из 3 тактических клеток с игровым состоянием Ничья.  

See [this](https://en.wikipedia.org/wiki/Ultimate_tic-tac-toe) for better explanation. Strategic Tic-Tac-Toe have larger gamefield and because of it introduces new move rules.
### Tactical-like ruleset
The ruleset of Tactical Tic-Tac-Toe declares mapping from Cells to Tactical Cells or a Gamerules on Tactical level.  
Tactical-like ruleset preserves mapping from Cells to Tactical Cells from rulset of Tactical Tic-Tac-Toe and declares that same rulse is applied for mapping from Tactical Cells to Strategic Cells.
In other words rules on Strategic level are the same as rules on Tactical level.
### Map-like ruleset
Map-like ruleset preserves rules of Tactical level and derives win rules and limits from Tactical to Strategic level but redefines move rules.  
The next move Strategic Cell is defined by number placed left from current Strategic Cell in the same row as Current Move Cell (see gamefield section to understand location of number).
### Hypermap-like ruleset  
Hypermap-like ruleset is similar to Map-like ruleset, but next move Strategic Cell is defined by number in Current Move Cell.  

## Gamefield
The _Basic gamefield_ is represented by 9x9 grid of Strategic Cells spaced by one Cell from each other (total 29x29 Cells) in each Strategic Cell Tactical Cell are marked. It can be drawn by hand on half Folio format sheet (16.5x20.5(cm)) with square 0.5(cm) markup also known as "notebook page" in my country.
Basic gamefield configuration expect players to use Tactical-like ruleset.
You can see Basic gamefield on picture below.  
![BASIC_GAMEFIELD_PIC](./Pics/Basic.png?raw=true "Basic gamefield")  
All other gamefields are build upon layout of Basic gamefield.  
Basic gamefield prototype can be found in  Fields/Basic.pdf file.  
The _Numbered gamefield_ is a Basic gamefield where all Tactical Cells numbered by theirs position in Tactical gamefield and Strategic gamefield. It can be drawn in same place as Basic gamefield but need one more Cell size on each side (31x31 Cells).  
![NUMBERED_GAMEFIELD_PIC](./Pics/Numbered.png?raw=true "Numbered gamefield")  
Numbered gamefield prototype can be found in  Fields/Numbered.pdf file.  
The _Mapped gamefield_ is a Numbered gamefield with mapping colums. Players are capable to play Map-like ruleset on this field. It can't be drawn in same space as Basic field. It's dimentions is 35x31 Cells and it still can be drawn on half Folio format sheet that rotated by 90 degrees.  
![MAPPED_GAMEFIELD_PIC](./Pics/Mapped.png?raw=true "Mapped gamefield")  
Mapped gamefield prototype can be found in  Fields/Mapped.pdf file.  
The _Hypermapped gamefield_ is a numbered gamefield with numbers inside of Operational Cells. Players are capable to play Hypermap-like ruleset on this field. It can't be drawn by hand with only one colour.  
![HYPERMAPPED_GAMEFIELD_PIC](./Pics/Hypermapped.png?raw=true "Hypermapped gamefield")  
Hypermapped gamefield prototype integrated in Full field can be found in  Fields/GameField_variant4.pdf file.  
The _Help field_ is represented by 11x15 Cell grid. It's purpose is to help players understand current game situation on Strategic level. It consists of 3x3 grid of Tactical cells spaced by one cell - _Tactical grid_, and additionl Tactical cell - _Strategic grid_. The purpose of Tactical grid is to indicate to which player which Tactical cell on Strategic field belongs. The purpose of Strategic grid is to indicate to which player which Strategic cell belongs.  
![HELP_FIELD_PIC](./Pics/Help_field.png?raw=true "Help field")  
Help field prototype can be found in  Fields/Help_field.pdf file.  
The _Move field_  ia a plece where players may record their moves. The proposed structure of Move field is 6xN Cell field with 3 collums belongs to X player and 3 other belongs to O player. Each of three collums are marked with latter **S**, **T** or **O** witch stends for **S**trategic **T**actical and **O**perational cells numbers of move.  
![MOVE_FIELD_PIC](./Pics/Move_field.png?raw=true "Move field")  
Move field prototype can be found in  Fields/Move_field.pdf file. Two more styles of Move field are avalible in Fields/Large_Move_field.pdf and Fields/Dense_Move_field.pdf  
The _Continuous Move field_ is Move field, specially designed for games with Tactical-like ruleset.  
![CONTINUOUS_MOVE_FIELD_PIC](./Pics/Move_field_variant2.png?raw=true "Continuous Move field")  
Continuous Move field prototype can be found in  Fields/Move_field_variant2.pdf file. One more style of Continuous Move field are avalible in Fields/Large_Move_field_variant2.pdf  
The _Full field_ is the assembly of Mapped gamefield, Help field and sevral Move fields. It can be drawn in full Folio format sheet with square 0.5(cm) markup also known as "notebook sheet" in my country or printed on A4 paper from GameField.pdf file from this repository.  
![FULL_FIELD_PIC](./Pics/GameField.png?raw=true "Full field")  
Full field prototype can be found in  Fields/GameField.pdf file. Two more designs of Full field are avalible in Fields/GameField_variant2.pdf and Fields/GameField_variant4.pdf  
## Origin
The game ruleset and game fields was invented during last week of March 2017 by [Me (rus page)](https://vk.com/id29240951) (Demchenko Mikhail Alexeevich) and [my friend (rus page)](https://vk.com/bern_mark) (Shashkov Anton Igorevich). It was made because we were tired of relatively short games of Ultimate Tic-Tac-Toe and want more chalenge and use of strategic thinking in simple paper-and-pencil game.  
## Legals
The _ruleset_ is any of Tactical-like ruleset, Map-like ruleset, Hypermap-like ruleset or any combination of them.  
The _gamefield_ is any of Basic gamefield, Numbered gamefield, Mapped gamefield, Hypermapped gamefield, Help field, Move field, Continuous Move field, Full field or any combination of them.  
The **Game idea** represented by _ruleset_ and  _gamefield_ is distributed worldwide under **CC-BY4.0** license.  
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Starategic Tic-Tac-Toe</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/echo-Mike/STTT" property="cc:attributionName" rel="cc:attributionURL">Demchenko Mikhail Alexeevich and Shashkov Anton Igorevich</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.  
 
The **Code** represented by all files in _Code_ directory is distributed worldwide under **MIT license**, see Code/LICENSE.md for full licens text.