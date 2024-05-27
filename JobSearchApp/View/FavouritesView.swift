//
//  FavouritesView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject private var coordinator: CoordinatorViewModel
    @EnvironmentObject private var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            
            Text("Избранное")
                .foregroundColor(.uiWhite)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.uiBlack)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
