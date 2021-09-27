//
//  ContentView.swift
//  Dota2Demo
//
//  Created by Chr1s on 2021/9/22.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var vm = ViewModel()
    
    var body: some View {
        Text("Hello world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
