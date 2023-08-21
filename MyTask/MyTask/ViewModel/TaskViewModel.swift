//
//  TaskViewModel.swift
//  MyTask
//
//  Created by Vijay Parmar on 18/07/23.
//

import Foundation

class TaskViewModel:ObservableObject{
    
    @Published var tasks:[Task] = []
    
    
    private var tempTask = Task.createMockTasks()
    
    func getTasks(isCompleted:Bool){
        
        tasks = tempTask.filter({$0.isCompleted == isCompleted})
        
    }
    
    func addTask(task:Task)->Bool{
        let taskId = Int.random(in: 4...100)
        let taskToAdd = Task(id: taskId, name: task.name, description: task.description, isCompleted: false, finishDate: task.finishDate)
        
        tempTask.append(taskToAdd)
        return true
    }
    
    func updateTask(task:Task)->Bool{
        
        if let index = tempTask.firstIndex(where: {$0.id == task.id}){
            
            tempTask[index].name = task.name
            tempTask[index].description = task.description
            tempTask[index].finishDate = task.finishDate
            tempTask[index].isCompleted = task.isCompleted
            
            return true
        }
        return false
    }
    
    func deleteTask(task:Task)->Bool{
        if let index = tempTask.firstIndex(where: {$0.id == task.id}){
            tempTask.remove(at: index)
            return true
        }
        return false
    }
    
}
