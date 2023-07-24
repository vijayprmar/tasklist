//
//  AddTaskView.swift
//  MyTask
//
//  Created by Vijay Parmar on 23/07/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var taskToAdd : Task = Task(id: 0, name: "", description: "", isActive: false, finishDate: Date())
    
    var body: some View {
        NavigationStack {
            List{
                Section {
                    TextField("Task Name", text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        
        AddTaskView(taskViewModel: TaskViewModel())
        
    }
}
