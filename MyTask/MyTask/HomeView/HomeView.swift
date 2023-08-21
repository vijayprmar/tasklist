//
//  HomeView.swift
//  MyTask
//
//  Created by Vijay Parmar on 19/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var taskViewModel:TaskViewModel = TaskViewModel()
    
    @State private var pickerFilters : [String] = ["Active","Completed"]
    
    @State private var defaultPickerSelectedItem : String = "Active"
    
    @State private var showAddTaskView = false
    @State private var showTaskDetailView = false
    @State private var selectedTask:Task = Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    
    @State private var refreshTaskList:Bool = false
    
    var body: some View {
        NavigationStack {
            
            Picker("Picker Filter", selection: $defaultPickerSelectedItem) {
                ForEach(pickerFilters,id: \.self){
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultPickerSelectedItem) { newValue in
                    
                    if defaultPickerSelectedItem == "Active"{
                        taskViewModel.getTasks(isCompleted: false)
                    }else{
                        taskViewModel.getTasks(isCompleted: true)
                    }
                    
                   
                }
            
            
            List (taskViewModel.tasks,id: \.id){ task in
                VStack(alignment: .leading, spacing: 8){
                    Text(task.name).font(.title).bold()
                    HStack{
                        Text(task.description).font(.headline).bold()
                            .lineLimit(1)
                        Spacer()
                        Text(task.finishDate.toString()).foregroundColor(.purple)
                    }
                    
                }
                .onTapGesture {
                    selectedTask = task
                    showTaskDetailView.toggle()
                }
            }
            .onAppear(){
                taskViewModel.getTasks(isCompleted: false)
                
            }
            .onChange(of: refreshTaskList, perform: { _ in
                if defaultPickerSelectedItem == "Active"{
                    taskViewModel.getTasks(isCompleted: false)
                }else{
                    taskViewModel.getTasks(isCompleted: true)
                }
            })
           
            
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddTaskView = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(taskViewModel: taskViewModel, showAddTaskView: $showAddTaskView, refreshTaskList: $refreshTaskList)
            }
            .sheet(isPresented: $showTaskDetailView) {
                TaskDetailView(taskViewModel: taskViewModel, showTaskDetailView: $showTaskDetailView, selectedTask: $selectedTask)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
