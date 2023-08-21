//
//  Task.swift
//  MyTask
//
//  Created by Vijay Parmar on 18/07/23.
//

import Foundation

struct Task{
    
    let id:Int
    var name:String
    var description:String
    var isCompleted:Bool
    var finishDate:Date
    
    static func createMockTasks()->[Task]{
        
        return [
        Task(id: 1, name: "Go To Gym", description: "Back Workout", isCompleted: false, finishDate: Date()),
        Task(id: 2, name: "Car Wash", description: "Downtown Carwash center", isCompleted: false, finishDate: Date()),
        Task(id: 3, name: "Office Work", description: "Finishpicker module", isCompleted: true, finishDate: Date())
        ]
        
    }
    
}
