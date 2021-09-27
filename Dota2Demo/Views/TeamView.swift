//
//  TeamView.swift
//  Dota2Demo
//
//  Created by Chr1s on 2021/9/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct TeamView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationView {
            
            List {
                
                ForEach(vm.team!.filter { $0.logoURL != nil && $0.name != "" && $0.logoURL?.suffix(3) == "png" }, id: \.self) { team in
                    
                    HStack {
                        
                        ZStack {
                            if let url = team.logoURL {
                                WebImage(url: URL(string: url))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(Circle())
                                 
                            }
                        }
                        .frame(idealWidth: 60, idealHeight: 60)
                        .fixedSize(horizontal: true, vertical: true)
                        
                        Text(team.name ?? "Unknown")
                    }
                }
            }
            .navigationTitle("战队列表")
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
