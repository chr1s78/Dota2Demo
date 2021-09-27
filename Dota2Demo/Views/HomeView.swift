//
//  HomeView.swift
//  Dota2Demo
//
//  Created by Chr1s on 2021/9/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        
        ZStack {
            
            if vm.hero == nil || vm.team == nil {
                ProgressView()
            } else {
                TabView {
                    HeroView()
                        .environmentObject(vm)
                        .tabItem {
                            Text("英雄")
                        }
                    
                    TeamView()
                        .environmentObject(vm)
                        .tabItem {
                            Text("战队")
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
