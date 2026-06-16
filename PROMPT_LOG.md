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




## TEMPLATE - date, tool

**Context**:

**Prompt Excerpt**:

**AI Summary**:

**Human Evaluation**:

**Final Decision**:

**Testing Verification**:

**Commit**:
