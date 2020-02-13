# TicTacToeClingo
Answer Set Programming AI that plays tic-tac-toe games

## Towers of Hanoi example program
This is to test that Clingo is up and running
To execute, run `clingo toh_ins.lp toh_enc.lp` from command line.

## Tic-Tac-Toe problem

### Constraint network

The tic-tac-toe board is made of three rows of three. 

Constraints:
* Variables: X(i, j) (i:1..3, j:1..3): the number of the square at (i,j)
* Domain: X(i, j) (i:1..3, j:1..3): null, ex, oh
* constraints
  * only a null can be overwritten with an ex or an oh
  * three ex's or three oh's in a row i form a win
  * three ex's or three oh's in a column j form a win
  * three ex's or three oh's in a diagonal form a win
