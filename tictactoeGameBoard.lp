%First step: given a board layout, identify if the board has a win

% Inital marks on the board
cell(1,1,x).
cell(1,2,x).
cell(1,3,o).

% cell(2,1,null).
% cell(2,2,null).
cell(2,3,o).

% cell(3,1,null).
% cell(3,2,null).
cell(3,3,o).

% Define board:
row(1..3).          % 3 rows: row(1), row(2), and row(3)
col(1..3).          % 3 columns: col(1), col(2), and col(3)
mark(null;x;o).    % 3 possible values: null, x, and o

%There can only exist one value for each cell
:- cell(I, J, Mark1), cell(I, J, Mark2), Mark1 != Mark2.

% Knowledge
% Cells have a default value of null if they aren't assigned an x or o
cell(I, J, null) :- c(I, J), not cell(I, J, x), not cell(I, J, o).
% Win if cells in the same row all have the same value
win :- cell(I, J1, Mark), cell(I, J2, Mark), cell(I, J3, Mark), J1 != J2, J1 != J3, J2 != J3, Mark !=null.
% Win if cells in the same column all have the same value
win :- cell(I1, J, Mark), cell(I2, J, Mark), cell(I3, J, Mark), I1 != I2, I1 != I3, I2 != I3, Mark !=null.
% Win if diagonals have the same value
win :- cell(I1, J1, Mark), cell(I2, J2, Mark), cell(I3, J3, Mark), 
        I1 = 1, J1 = 1, I2 = 2, J2 = 2, I3 = 3, J3 = 3,
        Mark != null.
win :- cell(I1, J1, Mark), cell(I2, J2, Mark), cell(I3, J3, Mark), 
        I1 = 3, J1 = 1, I2 = 2, J2 = 2, I3 = 3, J3 = 1,
        Mark != null.

#show cell/3. %Shows all cells
#show win/0.  %Shows "win" if win exists