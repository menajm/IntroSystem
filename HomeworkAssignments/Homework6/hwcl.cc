#include <stdio.h>

/*
The printTriangleWhile method will print a triangle in this 
formation:
 +++++++ 
  +----+ 
   +---+ 
    +--+ 
     +-+ 
      ++ 
       +
*/
void printTriangleWhile(int height)
{
    //If the height is invalid, nothing will be printed.
    if (height < 1) {
        return;
    }

    int row = 0; //This is a counter
    //This loop controls the rows of the triangle
    while (row < height) {
        int spaces = row; //For the number og leading zeros
        //Print the number of spaces needed
        while (spaces > 0)
        {
            printf(" ");
            spaces--;
        }
        //If it is the first or last row....
        if (row == 0 || row == height - 1)
        {
            int pluses = height - row;
            while (pluses > 0)
            {
                printf("+");
                pluses--;
            }
        } else { //For the rest of the rows
            printf("+");

            int dashes = height - row - 2;
            //Print the number of dashes needed.
            while (dashes > 0)
            {
                printf("-");
                dashes--;
            }
            printf("+");
        }
        printf("\n"); //Move to the next row
        row++;
    }
}

/*
The printTriangleFor method will print a triangle in the following
format:
         + 
        +-+ 
       +---+ 
      +-----+ 
     +-------+ 
    +---------+ 
   +++++++++++++ 
*/
void printTriangleFor(int height)
{
    //If the height is < 1, no triangle is printed
    if (height < 1)
    {
        return;
    }
    //Iterate through each row.
    for (int row = 0; row < height; row++)
    {
        //Print the spaces brfore the '+'
        for (int space = 0; space < height - row - 1; space++)
        {
            printf(" ");
        }
        //If this is the first or last row...
        if (row == 0 || row == height - 1)
        {
            for (int plus = 0; plus < 2 * row + 1; plus++)
            {
                printf("+");
            }
        } else { //For the rest of the rows
            printf("+"); //This will print the first plus

            for (int dash = 0; dash < 2 * row - 1; dash++)
            {
                printf("-");
            }

            printf("+"); //This wil print the last plus.
        }
        printf("\n");
    }
} 