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
    var isActive:Bool
    var finishDate:Date
    
    static func createMockTasks()->[Task]{
        
        return [
        Task(id: 1, name: "Go To Gym", description: "Back Workout", isActive: true, finishDate: Date()),
        Task(id: 2, name: "Car Wash", description: "Downtown Carwash center", isActive: true, finishDate: Date()),
        Task(id: 3, name: "Office Work", description: "Finishpicker module", isActive: false, finishDate: Date())
        ]
        
    }
    
}
