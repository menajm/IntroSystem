#include <stdio.h>

/*
    The countCharRange function count the characters that are
    between the specified characters (including the characters
    specified) in a string.
*/
int countCharRange (char *str, char c1, char c2) { 
    int count = 0;
    int rangeL = (c1 < c2) ? c1 : c2;
    int rangeR = (c1 > c2) ? c1 : c2;


    while (*str) {     
        if (*str >= rangeL && *str <= rangeR) {
            count++;
        }
        //Make sure to point str at the next character 
        str++;
    } 
    return count; 
} 

/*
    This function will find the end of a string.
*/
char *findStringEnd(char *str) 
{ 
    while (*str)
    {
        str++;
    }
    return str; //This will return a pointer to the null terminator
} 

/*
    This function will use a pointer to concatenate the string
    passed ontp itself.
*/
void doubleString(char *str)
{
    char *end = findStringEnd(str); //Has the pointer to the null terminator
    char *src = str;
    char *dst = end;

    while (src < end)
    {
        *dst = *src; //This will copy the character from src to dst

        src++;
        dst++;
    }

    *dst = '\0'; //Make sure to terminate the new string
}

/*
    This method will concatenate the string passed onto itself 
    with characters in reverse order to make a palindrome.
*/
void palindrome(char *str)
{
    char *end = findStringEnd(str); //Has the pointer to the null terminator
    char *src = end - 1; //This will make sure we are starting from the last character
    char *dst = end;

    while (src >= str)
    {
        *dst = *src; //This will copy the character from src to dst

        src--;
        dst++;
    }

    *dst = '\0'; //Make sure to terminate the new string
}