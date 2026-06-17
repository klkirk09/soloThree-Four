## ENTRY 1: Main App Skeleton (June 16, ChatGPT)

**Context**: 
Wanted a general app structure and skeleton for Solo 3 and 4. 

**Prompt Excerpt**: 
Generate basic code structure for the flutter main file Dog Breed Diary app. Use a stateful
widget for the main page and generate base code for a Fetch dog button, variables for image URL, 
loading state, error state. Do not implement any functions yet.

**AI Summary**:
Generated a basic flutter skeleton for the application to be built on top of. Did not 
implement any functions, but left To Do functions to be implemented. 

**Human Evaluation**:
The generated code looks to be a good starting structure for the asisgnment. 
There will still need to be many packages and additions to the code.

**Final Decision**:
Used the structure to build the Solo Three and Four application on top of. 
This structure will be used to plan and implement the rest of the project.

**Testing Verification**:
Ran the application successfully, no errors in the basic structure.

**Commit**:
initial commit with skeleton code


## ENTRY 2: Generating fetchDog Function - July 16, ChatGPT

**Context**:
Needed to create the main function to send an API request that retrieves a random dog image 
from the dog CEO API and update app state accordingly. 

**Prompt Excerpt**:
Generate the Flutter fetchDog() function using the dog CEO API, http package,
async/await and use try and catch error handling. Also ensure to use the existing state variables
for loading, errors, and the image URL that is returned. 


**AI Summary**:
The AI generated a fetchDog function that sends an HTTP get request using the http package,
parses JSON response, checks status, extracts image URL, and updates error
and loading states

**Human Evaluation**:
The code appears to be correct and effective for generating the image.                                                                                                

**Final Decision**:
The function will be accepted but needs to be troubleshot to figure out where the booting
error is originating. 

**Testing Verification**:
There is some kind of error with the code that is not allowing the app to boot correctly. More
testing will need to be done to ensure that it is not the fetchDog function.

**Commit**:
fetchdog initial commit


## Entry 3: Debugging app launch failure issue - June 16, ChatGPT

**Context**:
The app was running successfully on the emulator, but would routinely 
crash and lose connection. The device was restarted and no change happened. 

**Prompt Excerpt**:
Provided flutter console output from the app attempting to run, with the prompt
"There is an error regarding the app connection and it needs to be determned whether it is a debugger
problem or app code"

**AI Summary**:
AI reccomended I restart the debugger, as well as replace my home 
screen with a simple home test to ensure it is not the fetchdog functiion causing the app 
to crash. 

**Human Evaluation**:
I restarted my debugger and replaced the mian screen with a base text body.
This loaded correctly, so I tested the dogHomePage again, to which it worked!


**Final Decision**:
This debugging was successsful, there must have been an issue with my debugger.
It must have been a coincidence it occurred right after implementing the 
fetchDog function 

**Testing Verification**:
All states now work, adn the fetchDog function returns an image of a dog.

**Commit**:
debugging and state implementation

## Entry 4 - Jun 16, ChatGPT

**Context**:
Needed to build out the four required states, loading, error, empty, and success. This
would represent each stage of the fetch process. 

**Prompt Excerpt**:
Modify the children of this appBar to correctly display the four states
loacing, error, empty and success. Use the prexistingt errorMessage, isLoading, and dogImageUrl
variables from the dogHomePage class.

**AI Summary**:
AI suggested the use of a loading spinner on load, error message
empty state message, and a line of code to display the dog image. 

**Human Evaluation**:
This code appears to be concise and sound, it appears to be logical. It matched
all assignment requirements. 

**Final Decision**:
Code was implemented on the main fetch screen.

**Testing Verification**:
All four states were tested and displayed correctly. restarted the app to ensure the empty 
state worked correctly. 

**Commit**:
debugging and state implementation


## Entry 5: Creating a class instance to store Dog objects to save- June 16, ChatGPT

**Context**:
Needed a way to store dog objects for when they are being saved for the solo 4
requirements. 

**Prompt Excerpt**:
Generate a dog model class including fields such as id and url and 
create a basic constructor.

**AI Summary**:
Responded with a basic dog class to build upon later. Insisted I create another separate file
for the class to keep code modular. 

**Human Evaluation**:
The code is a sound Dog class with no extra uneccesary flourish. This will
be instrumental to saving objects with SQLite

**Final Decision**:
Dog model class was created and added to lib.

**Testing Verification**:
Code compliles, dog class is not being used yet so extensive testing cannot be done.

**Commit**:



## Entry 6: Setting the skeleton for SQL database storage - June 16th, ChatGPT

**Context**:
Start implementing the storage function of the application to enforce data 
persistence between the app closing and opening. 

**Prompt Excerpt**:
Create basic skeleton code to begin implementing database initialization, 
a table for dogs being saved, and unimplemented functions for the creation and deletion
of saved dogs.

**AI Summary**:
Generated a databaseHelper function with basic functions that created and opened the database,
as well as unimplemented functions for save dog, load all dogs, delete one dog, and delete
all dogs. 

**Human Evaluation**:
The database logic appears sound, I had to tinker with the prompting some to manage excessive 
logic surrounding the database opening.

**Final Decision**:
The skeleton is accepted and implemented in main under the dogHomeState.

**Testing Verification**:
Main was temporarliy repalced with a function to ensure that the databse is initialized correctly.
The code compiles safely, further testing will be conducted when the functions are implemented
and the save Dog UI is implemented.

**Commit**:
SQLite skeleton, database setup and dog class creation



## Entry 7: Save and Load favorite dogs  - June 16th, ChatGPT

**Context**:
Needed to be able to save dogs from the fetch dogs page to add them to the saved dogs database.

**Prompt Excerpt**:
Generate simple and efficient code to insert a dog into the SQLite database and retreive all saved 
dogs. Additonally, generate a simple saved dogs page to display results on. 

**AI Summary**:
Generated insertDog and getAllDogs function, as well as a basic saved dogs stateful widget
that displays all the saved dogs.

**Human Evaluation**:
This solution matches the assignment instructions by connecting the API requests to storing 
them into a local backend. I modified some structure but the basic functionality remains the 
same.

**Final Decision**:
The code will be implemented in full, it has good indication for the states of waiting and 
error handling. 

**Testing Verification**:
Tested adding dogs and loading them on the saved dogs screen, both were successful even
upon closing and reopening the application.

**Commit**:
Dog database functions: save, load all, delete, clear all


## TEMPLATE - date, tool

**Context**:
Users need to be able to remove singular dogs and clear all saved dogs 
from the saved dogs page. This meets assignment requirements by allowing the user to modify
the saved dog list. 


**Prompt Excerpt**:
Implement the delete one and clear dogs functions in the database helper class. 
Delete dog should remove one dog by ID from the database and clear all dogs should clear
the database. ensure to use the SQLite database package for the operations. 


**AI Summary**:
Provided the above code and suggested the addition of the delete one button to each
listTile and the clear all functionality in the app bar

**Human Evaluation**:
The suggested approach seemed reasonable and fit well into already existing UI.
I took the suggestion and put the trashcan in the listTile element and 
the clear all button in the top right of the appbar

**Final Decision**:
Implemented deleteDog and clearAllDogs functionality and connected them via 
buttons to the saved dogs interface. 

**Testing Verification**:
The deletedog and clear all dogs buttons were tested many times with opening and 
closing the app also tested to ensure the state was recorded correctly. 

**Commit**:
Dog database functions: save, load all, delete, clear all