//NOTE THAT I AM USING STRING.H FOR TESTING IN THIS MAIN.CC
//YOU CAN USE STRING.H TO TEST IN MAIN.CC TOO.
//BUT YOU CANNOT USE ANY STRING.H FUNCTION IN POINTERS.CC
//OR YOU WILL FAIL THE WEB-CAT TEST.


#include <stdio.h>
#include <string.h>

int countCharRange(char*, char, char);
char *findStringEnd(char*);
void doubleString(char*);
void palindrome(char*); 


int main() {
  
  //Make a big string
  char str1[] = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789";
  
  //Overwrite the first part of str1 with a new string with strcpy.  The new will look like this.
  //Note the \0 at position 3.  If you print str1 now it will only print aabbccddeaae::gaaghhbbbijjccklmno
  //char str1[] = "aabbccddeaae::gaaghhbbbijjccklmno\0456789012345678901234567890123456789012345678901234567890123456789";  
  strcpy (str1, "aabbccddeaae::gaaghhbbbijjccklmno"); 
  
  
  int c = countCharRange(str1, 'e', 'm');
  if (c != 12) {
    printf("\n\nERROR: countCharRange returned %d and should have returned 12\n", c);
    printf("when using the following string\n%s\n", str1);
    printf("and delimiter characters 'e' and 'm'\n");
  }
  else 
    printf("\n\nFunction countCharRange passed.\n");
  

  char str2[] = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789";
  strcpy(str2, "abcd");
  //Point c to the null zero.
  char *ch = findStringEnd(str2);  
  
  if (*(ch - 1) != 'd') {
    printf("\n\nERROR: In findStringEnd, the character before the NULL is d.");
    printf(" Yours is reporting %c.\n", *(ch - 1));
  }
  else 
    printf("\n\nFunction findStringEnd passed.\n");
  

  char str3[] = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789";  
  strcpy(str3, "AbcDef");
  doubleString(str3);
  if (strcmp(str3, "AbcDefAbcDef")){
    printf("\n\nERROR: Your string is incorrect in doubleString.\n");
    printf("The string should be:\nAbcDefAbcDef\nYours is:\n%s\n", str3);
  }
  else
    printf("\n\nFunction doubleString passed.\n");
  
  
  char str4[] = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789";
  strcpy(str4, "AbcDef");;
  palindrome(str4);
  if (strcmp(str4, "AbcDeffeDcbA")) {
    printf("\n\nERROR: Your string is incorrect in palindrome.\n");
    printf("The string should be:\nAbcDeffeDcbA\nYours is:\n%s\n", str4);
  }
  else
    printf("\n\nFunction palindrome passed.\n");
  
}
