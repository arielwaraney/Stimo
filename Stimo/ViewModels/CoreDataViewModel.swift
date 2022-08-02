//
//  CoreDataViewModel.swift
//  Stimo
//
//  Created by Ariel Waraney on 28/07/22.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [TaskEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "TaskCoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading Core Data : \(error)")
            }
        }
        fetchTasks()
    }
    
    //MARK: Call this function for refresh the result
    func fetchTasks() {
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        //MARK: Try & Catch In Swift
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching. \(error)")
        }
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTasks()
        } catch let error {
            print("Error Saving. \(error)")
        }
    }
    func addTask(name: String){
        let newTask = TaskEntity(context: container.viewContext)
        newTask.name = name
        newTask.isCompleted = false
        saveData()
    }
    
    func deleteTask(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func toggleTask(entity: TaskEntity){
        entity.isCompleted.toggle()
        saveData()
    }
    
    func isToggled(entity: TaskEntity)-> Bool {
        if entity.isCompleted{
            return true
        } else {
            return false
        }
    }
}
