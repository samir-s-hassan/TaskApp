# Project 7 - Task
Submitted by: Samir Hassan

Task is an app that ... [TODO] 

Time spent: 3 hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] App displays a list of tasks
- [X] Users can add tasks to the list
- [X] Session persists when application is closed and relaunched (tasks dont get deleted when closing app) 
  - [X] Note: You have to quit the app, not minimize it, in order to see the persistence.
- [X] Tasks can be deleted
- [X] Users have a calendar view via navigation controller that displays tasks	


The following **additional** features are implemented:

- [X] Tasks can be toggled completed
- [X] User can edit tasks by tapping on the task in the feed view
- [X] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

[Video]](X) .

## Notes

A challenge I initially encountered was that I wasn't making a tasksKey. Both the save() and getTasks() method have a parameter "forKey: ". I left this blank at first and then it didn't
work. So I replaced it with "forKey: key" into that function portion which didn't work either. I realized that I had to make a computed property tasksKey that returns a string "Tasks".
With this I'd be able to access the tasksKey property from anywhere. 

Another challenge I encountered was that the task when completed would create an identical task of itself. I found that I couldn't keep the createdDate and id as let constants and 
needed to change them to var to make them mutable. Once I did this, the removal and insertion of tasks worked and allowed me to update a task without error. Therefore, a task could be 
updated without the task creating another version of itself.

A last challenge I faced was with the relationship segues. I accidentally created three items on the navigation bar and I realized that it would auto-generate 3 items in the 
navigation bar when I connected to the wrong Navigation ViewController. To fix this, I manually deleted and kept track of my relationships. Through this I was able to ensure 
that my navigation bar had the right amount of items.

## License

    Copyright 2024 Samir Hassan

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.