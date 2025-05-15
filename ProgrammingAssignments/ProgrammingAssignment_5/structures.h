//Below are the constants that will be used for structures
#define NAME_SIZE 80
#define SSN_SIZE 13
#define NUM_PEOPLE 10

//Structure definitions
typedef struct{
    char name[NAME_SIZE];
    char ssn[SSN_SIZE];
    int yearOfBirth; 

}person_t;

//Prototypes
void getOnePerson(person_t *person);
void printOnePerson(person_t person);
void getPeople(person_t people[], int numPeople);
void printPeople(person_t people[], int numPeople);