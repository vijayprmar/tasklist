//
//  AddTaskView.swift
//  MyTask
//
//  Created by Vijay Parmar on 23/07/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var taskToAdd : Task = Task(id: UUID(), name: "", description: "", isCompleted: false, finishDate: Date())
    @Binding var showAddTaskView : Bool
    @Binding var refreshTaskList : Bool
    @State var showDirtyCheckAlert : Bool = false
    
    var pickerDateRange:ClosedRange<Date>{
        let calender = Calendar.current
        let currentDateComponent = calender.dateComponents([.day,.month,.year,.hour,.minute], from: Date())
        
        let startDateComponent = DateComponents(year: currentDateComponent.year,month: currentDateComponent.month,day: currentDateComponent.day,hour: currentDateComponent.hour,minute: currentDateComponent.minute)
        
        let endDateComponent = DateComponents(year: 2024,month: 24,day: 31)
        
        return calender.date(from: startDateComponent)! ... calender.date(from: endDateComponent)!
        
        
    }
    
    var body: some View {
        NavigationStack {
            List{
                Section(header:Text("Task Detail")) {
                    TextField("Task Name", text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
                Section(header:Text("Task Date/Time")) {
                    DatePicker("Task Date", selection: $taskToAdd.finishDate,in:pickerDateRange)
                }
                
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading) {
                    Button{
                        if !(taskToAdd.name.isEmpty){
                            showDirtyCheckAlert.toggle()
                        }else{
                            showAddTaskView.toggle()
                        }
                        
                        
                    } label: {
                        Text("Cancel")
                    }
                    .alert("Save Task", isPresented: $showDirtyCheckAlert) {
                        
                        Button("Cancel") {
                            showAddTaskView.toggle()
                        }
                        
                        Button("Save") {
                            addTask()
                        }
                        
                        
                    }message: {
                        Text("Would you like to save the task?")
                    }

                }
                
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button{
                       
                        addTask()
                        
                    } label: {
                        Text("Add")
                    }
                    .disabled(taskToAdd.name.isEmpty )

                }
                
            }
            
        }
        
    }
    
    private func addTask(){
        if taskViewModel.addTask(task: taskToAdd){
            showAddTaskView.toggle()
            refreshTaskList.toggle()
        }
    }
    
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        
        AddTaskView(taskViewModel: TaskViewModelFactory.createTaskViewModel(), showAddTaskView: .constant(false), refreshTaskList: .constant(false))
        
    }
}
