//
//  TaskViewModelFactory.swift
//  MyTask
//
//  Created by Vijay Parmar on 18/10/23.
//

import Foundation

final class TaskViewModelFactory{
    
    static func createTaskViewModel() -> TaskViewModel{
        return TaskViewModel(taskRepository: TaskRepositoryImplementation())
    }
    
}
