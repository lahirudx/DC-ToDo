//
//  RealmManager.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error.localizedDescription)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm \(newTask)")
                }
            } catch {
                print("Error adding task to Realm: \(error.localizedDescription)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm {
            let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
            guard !taskToUpdate.isEmpty else { return }
            
            do {
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with \(id)! Completed status: \(completed)")
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm {
            let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
            guard !taskToDelete.isEmpty else { return }
            
            do {
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Deleted task with \(id)!")
                }
            } catch {
                print("Error deleting task \(id) from Realm: \(error.localizedDescription)")
            }
        }
    }
}
