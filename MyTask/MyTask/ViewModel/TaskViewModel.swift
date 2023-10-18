//
//  TaskViewModel.swift
//  MyTask
//
//  Created by Vijay Parmar on 18/07/23.
//

import Foundation

class TaskViewModel:ObservableObject{
    
    
    private let taskRepository :TaskRepository
    
    
    @Published var tasks:[Task] = []
   
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
    }
 
    func getTasks(isCompleted:Bool){
        self.tasks = taskRepository.get(isCompleted: isCompleted)
    }
    
    func addTask(task:Task)->Bool{
        return taskRepository.add(task: task)
    }
    
    func updateTask(task:Task)->Bool{
        return taskRepository.update(task: task)
    }
    
    func deleteTask(task:Task)->Bool{
        return taskRepository.delete(task: task)
    }
    
}
