//
//  FavoritesIndication.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 18.04.2024.
//

import SwiftUI

struct FavoritesIndication: View {
    
    @ObservedObject var viewModel = AppViewModel()
    
    var body: some View {
        ZStack {
            Circle()
                .frame(height: 13)
                .foregroundColor(.uiRed)
            
            Text("\(viewModel.favoriteVacancies.count)")
                .fontNumber()
                .foregroundColor(.uiWhite)
        }
    }
}

struct FavoritesIndication_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesIndication()
    }
}
