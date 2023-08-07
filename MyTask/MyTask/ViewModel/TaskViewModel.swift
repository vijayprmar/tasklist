//
//  TaskViewModel.swift
//  MyTask
//
//  Created by Vijay Parmar on 18/07/23.
//

import Foundation

class TaskViewModel:ObservableObject{
    
    @Published var tasks:[Task] = []
    
    func getTasks(isActive:Bool){
        
        tasks = Task.createMockTasks().filter({$0.isCompleted == isActive})
        
    }
    
    
}
