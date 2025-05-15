/*
    Programming Assignment #5: Structures in C
    @Author Jenna Mena
*/
#include <stdio.h> 
#include <string.h> 
#include "structures.h" 

/*
    The getOnePerson function gets a single name, ssn, and year of
    birth from the terminal using scanf
*/
void getOnePerson(person_t *person)
{
    char c; //So I can handle the newline character
    
    //Get the name of the person
    printf("Enter full name: ");
    scanf("%79[^\n]", person->name);
    scanf("%c", &c); //Handling the newline character here

    //Get the ssn
    printf("Enter ssn: ");
    scanf("%79[^\n]", person->ssn);
    scanf("%c", &c); //Handling the newline character here

    //Get the birth year
    printf("Enter year of birth: ");
    scanf("%d", &person->yearOfBirth);
    scanf("%c", &c); //Handling the newline character here
}

/*
    The function printOnePerson takes a Person (by value, 
    not by reference) as a parameter.  This function should print the name, ssn, and 
    yearOfBirth from the structure in the following format: 

    John_Heimerschmidt:111-11-1111:1862
*/
void printOnePerson(person_t person)
{
    printf("%s:%s:%d\n", person.name, person.ssn, person.yearOfBirth);
}

/*
    The function getPeople takes an array of person_t structures and the 
    number of people to get.
*/
void getPeople(person_t people[], int numPeople)
{
    for (int i = 0; i < numPeople; i++)
    {
        getOnePerson(&people[i]);
    }
}

/*
    The printPeople function takes an array of person_t structures
    and the number of people to print.
*/
void printPeople(person_t people[], int numPeople)
{
    for (int i = 0; i < numPeople; i++)
    {
        printOnePerson(people[i]);
    }
}