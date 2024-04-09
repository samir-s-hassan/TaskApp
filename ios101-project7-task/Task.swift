//
//  Task.swift
//

import UIKit

// The Task model
struct Task: Codable {

    // The task's title
    var title: String

    // An optional note
    var note: String?

    // The due date by which the task should be completed
    var dueDate: Date

    // Initialize a new task
    // `note` and `dueDate` properties have default values provided if none are passed into the init by the caller.
    init(title: String, note: String? = nil, dueDate: Date = Date()) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
    }

    // A boolean to determine if the task has been completed. Defaults to `false`
    var isComplete: Bool = false {

        // Any time a task is completed, update the completedDate accordingly.
        didSet {
            if isComplete {
                // The task has just been marked complete, set the completed date to "right now".
                completedDate = Date()
            } else {
                completedDate = nil
            }
        }
    }

    // The date the task was completed
    // private(set) means this property can only be set from within this struct, but read from anywhere (i.e. public)
    private(set) var completedDate: Date?

    // The date the task was created
    // This property is set as the current date whenever the task is initially created.
    let createdDate: Date = Date()

    // An id (Universal Unique Identifier) used to identify a task.
    let id: String = UUID().uuidString
}

// MARK: - Task + UserDefaults
extension Task {

    // The Tasks key: a computed property that returns a String.
    //    - Use when saving/retrieving or removing from UserDefaults
    //    - `static` means this property is "Type Property" (i.e. associated with the Task "type", not any particular movie instance)
    //    - We can access this property anywhere like this... `Task.tasksKey` (i.e. Type.property)
    static var tasksKey: String {
        return "Tasks"
    }

    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ tasks: [Task]) {

        let encodedData = try! JSONEncoder().encode(tasks)
        UserDefaults.standard.set(encodedData, forKey: tasksKey)
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getTasks() -> [Task] {
        
        // TODO: Get the array of saved tasks from UserDefaults

        return [] // 👈 replace with returned saved tasks
    }

    // Add a new task or update an existing task with the current task.
    func save() {

        // 1. Retrieve the array of saved tasks
        var tasksArray = Task.getTasks()
        
        // 2. Check if the current task already exists in the tasks array
        if let index = tasksArray.firstIndex(where: { $0.id == self.id }) {
            // 3. If it does, update the existing task
            tasksArray.remove(at: index) // Remove the existing task
            tasksArray.insert(self, at: index) // Insert the updated task
        } else {
            // 4. If no matching task already exists, add the new task to the end of the array
            tasksArray.append(self)
        }
        
        // 5. Save the updated tasks array to UserDefaults
        Task.save(tasksArray)
    }
}
