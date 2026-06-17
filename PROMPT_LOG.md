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

## TEMPLATE - date, tool

**Context**:

**Prompt Excerpt**:

**AI Summary**:

**Human Evaluation**:

**Final Decision**:

**Testing Verification**:

**Commit**:
