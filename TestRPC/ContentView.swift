//
//  ContentView.swift
//  TestRPC
//
//  Created by Gyeongtae Nam on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model: TodoModel = TodoModel() 
    var body: some View {
        VStack {
            // Image(systemName: "globe")
            //     .imageScale(.large)
            //     .foregroundColor(.accentColor)
            // Text("Hello, world!")
            
            ForEach(model.items) { item in
                VStack(spacing: 0) {
                    Text(item.title)
                    Text(item.id?.uuidString ?? "" )
                    
                }
                
            }
        }
        .padding()
        .onAppear {
           
           // model.delete(id: "4C859B3C-B21B-4048-8984-D852910664CD")
            model.load()
            //
            // let todo = Todo(title: "b")
            // model.create(todo: todo)
           // let repo =  DataRepository.shared
           //
           //  print(repo.client)
           //  
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
