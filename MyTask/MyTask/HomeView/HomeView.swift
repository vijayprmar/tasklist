//
//  HomeView.swift
//  MyTask
//
//  Created by Vijay Parmar on 19/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var taskViewModel:TaskViewModel = TaskViewModel()
    
    @State private var pickerFilters : [String] = ["Active","Completed"]
    
    @State private var defaultSelectedPickerItem : String = "Active"
    
    var body: some View {
        NavigationStack {
            
            Picker("Picker Filter", selection: $defaultSelectedPickerItem) {
                ForEach(pickerFilters,id: \.self){
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultSelectedPickerItem) { newValue in
                    taskViewModel.getTasks(isActive: defaultSelectedPickerItem == "Active")
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
            }.onAppear(){
                taskViewModel.getTasks(isActive: true)
                
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("add task view")
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
