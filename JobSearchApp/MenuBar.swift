//
//  MenuBar.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct MenuBar: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    init() {}
    
    private var activeTab: Coordinator.Page? {
        return coordinator.tabs.contains(coordinator.startPage) ? coordinator.startPage : nil
    }
    
    var body: some View {
        TabBarVIew
    }
    
struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBar()
    }
}
