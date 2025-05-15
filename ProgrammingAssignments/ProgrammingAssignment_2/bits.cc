#include <stdio.h>

int highLow(int v1, int v2)
{
    //upperR and lowerR will mask their respective parts of the numbers v1 and v2
    int upperR = v1 & 0xFFFF0000;
    int lowerR = v2 & 0x0000FFFF;

    //Now combine to get the result.
    int result = upperR | lowerR;
    return result;
}

int countPairs(int n)
{
    int count = 0;
    int onesCount = 0; //To count consecutive 1s
    
    for (int i = 0; i < 32; i++) {
        if (n & 1) {  //If the rightmost bit is 1
            onesCount++;  
        } else {  
            if (onesCount == 2) { //Only count if there were exactly two 1s
                count++;
            }
            onesCount = 0; //Reset onesCount when hitting a 0
        }
        n >>= 1; //Shift right to check the next bit
    }
    if (onesCount == 2) {
        count++;
    }
    return count;
}

void printDashOct(int n)
{
    //First, take care of the first two bits on the left.
    int leftMostBits = (n >> 30) & 3; //Extract the leftmost 2 bits (31 and 30)
    printf("%o-", leftMostBits); //Print their octal value followed by a dash
    
    //Go through the rest of the groups of 3
    for (int i = 9; i >= 0; i--) { //Loop through the next 10 groups of 3 bits
        int octDigit = (n >> (i * 3)) & 7; //Extract 3 bits for each octal digit
        printf("%o", octDigit); //Print the octal digit
        if (i > 0) {
            printf("-"); //Add a dash between octal digits, but not after the last one
        }
    }
    printf("\n"); //Print a newline at the end
}