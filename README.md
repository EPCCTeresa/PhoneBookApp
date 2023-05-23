# README
# RPS

This API provides the ability to create, list, update and delete phone contacts.


* Ruby version
3.0.2

* Installation
Download this repo by using git clone command and execute in your local machine:

$ bundle install

* Execution
After downloading and installing the proyect, let's execute the server by running

$ rails s
Now the server is ready to receive petitions. There are two options:

- Go to a web browser and use the url: http:/localhost::3000. The user will be able to follow the flow of the app then.

- Use a HTTP client and make a GET call to the url: http://localhost:3000/


* Improvements
- Make the UX more user friendly, according to current front frameworks
- Tests
- Provide the possibility to filter the listed records in order to avoid overloading the visual information that the end user receives from the Web App.


* Technical decisions

According to me, it is not a good practise to create PRs with tones of files modified, so I decided to separate in different MRs instead of creating several commits. I believe it depends on the developer. From my point of view I prefer to review very specific PRs and well focused on what they are supposed to do. Peviewing a long PR can make it difficult to review and even miss the objective for which the PR exists.