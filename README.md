# TicTacToeClingo
Answer Set Programming AI that plays tic-tac-toe games

## Towers of Hanoi example program
This is to test that Clingo is up and running
To execute, run `clingo toh_ins.lp toh_enc.lp` from command line.

## Tic-Tac-Toe problem

### Constraint network

The tic-tac-toe board is made of three rows of three. 

#### Constraint Satisfaction Problem:
* Variables: 
  * Cell(i, j) (i:1..3, j:1..3): the number of the square at (i,j)
  * Win: if the game is won or not
* Domain: 
  * Cell(i, j) (i:1..3, j:1..3): null, ex, oh
  * Win: true, false
* constraints
  * only a null can be overwritten with an ex or an oh
  * three ex's or three oh's in a row i form a win
  * three ex's or three oh's in a column j form a win
  * three ex's or three oh's in a diagonal form a win

#### Translate to ASP "Objects, Relations, Knowledge" frame
* Objects:
  * cells: c(i,j)
  * Mark: null, x, o
  * win: true, false
* Relations
  * The cell c(I, J) has the value of Mark
    * val(I, J, Mark)
  * Cells are in a diagonal
    * diagonal(i1,j1,i2,j2,i3,j3)
  * Win indicates the AI found a winning move
* Knowledge
  * Diagonal cells are (c(1,1), c(2, 2), and c(3,3)) or ((c(1,3), c(2,2), and c(3,1))
    * diagonal(I1,J1,I2,J2,I3,J3) :- I1 = 1, J1 = 1, I2 = 2, J2 = 2, I3 = 3, J3 = 3.
     I1 = 1, J1 = 3, I2 = 2, J2 = 2, I3 = 3, J3 = 1.
  * Cells have a default value of null if they aren't assigned an x or o
    * val(I, J, null) :- c(I, J), not val(I, J, x), not val(I, J, o).
  * Win if cells in the same row all have the same value
    * Win :- val(I, J1, Mark), val(I, J2, Mark), val(I, j3, Mark), J1 != J2 != J3, Mark !=null.
  * Win if cells in the same column all have the same value
    * Win :- val(I1, J, Mark), val(I2, J, Mark), val(I3, j, Mark), I1 != I2 != I3, Mark !=null.
  * Win if diagonals have the same value
    * Win :- diagonal(I1,J1,I2,J2,I3,J3), val(I1, J1, Mark), val(I2, J2, Mark), val(I3, J3, Mark), Mark != null.