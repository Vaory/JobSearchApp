//
//  TabBarVIew.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 06.04.2024.
//

import SwiftUI

struct TabBarView: View {

    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = AppViewModel()
    
    var body: some View {
            CustomTabBar(tabs: coordinator.tabs, selectedTab: $coordinator.startPage) { tab in
                self.coordinator.changeTab(to: tab)
            }
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.bottom)
        }
    }

struct CustomTabBar: View {
    let tabs: [Coordinator.Page]
    @Binding var selectedTab: Coordinator.Page
    let tabSelection: (Coordinator.Page) -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs) { tab in
                Button(action: {
                    self.selectedTab = tab
                    self.tabSelection(tab)
                }) {
                    VStack(spacing: 3) {
                        if tab == .favourites {
                            ZStack {
                                Image(self.selectedTab == tab ? "active\(tab.id)" : tab.id)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                
                                if AppViewModel().favoriteVacancies.count > 0 {
                                FavoritesIndication()
                                    .offset(x: 8, y: -8)
                                    
                                }
                            }
                        } else {
                            Image(self.selectedTab == tab ? "active\(tab.id)" : tab.id)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                        }
                        
                        Text(tab.id)
                            .fontTabText()
                            .foregroundColor(self.selectedTab == tab ? .uiBlue : .uiGray4)
                    }
                    .frame(height: 70)
                    .frame(maxWidth: .infinity)
                }
                .background(Color.uiBlack)
            }
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            TabBarView()
                .environmentObject(Coordinator())
        }
    }
