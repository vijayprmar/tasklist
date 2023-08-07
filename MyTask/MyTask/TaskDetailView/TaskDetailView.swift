//
//  TaskDetailView.swift
//  MyTask
//
//  Created by Vijay Parmar on 24/07/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    
    @ObservedObject var taskViewModel: TaskViewModel
    @Binding var showTaskDetailView:Bool
    @Binding var selectedTask : Task
    
    var body: some View {
        NavigationStack {
            List{
                Section(header:Text("Task Detail")) {
                    TextField("Task Name", text: $selectedTask.name)
                    TextEditor(text: $selectedTask.description)
                    Toggle("Mark Complted", isOn: $selectedTask.isCompleted)
                }
                Section(header:Text("Task Date/Time")) {
                    DatePicker("Task Date", selection: $selectedTask.finishDate)
                }
                
                Section {
                    Button {
                        print("")
                    } label: {
                        Text("Delete").fontWeight(.bold).foregroundColor(.red)
                            .frame(maxWidth: .infinity,alignment: .center)
                    }

                }
                
            }
            .navigationTitle("Task Detail")
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button{
                        showTaskDetailView = false
                    } label: {
                        Text("Cancel")
                    }

                }
                
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button{
                        print("Add button tapped")
                    } label: {
                        Text("Update")
                    }

                }
                
            }
            
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskViewModel: TaskViewModel(), showTaskDetailView: .constant(false), selectedTask: .constant(Task.createMockTasks().first!))
    }
}
