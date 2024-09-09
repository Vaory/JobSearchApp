//
//  FavouritesView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text ("Избранное")
                .fontTitle2()
                .foregroundColor(.uiWhite)
            
            Text("\(viewModel.favoriteVacancies.count) \(viewModel.pluralize(viewModel.favoriteVacancies.count, "вакансия", "вакансии", "вакансий"))")
                .fontText1()
                .foregroundColor(.uiGray3)
                .padding(.vertical, 16)
            
            ScrollView(.vertical) {
                ForEach(viewModel.favoriteVacancies, id: \.id) { vacancy in
                    VacancyPreview(vacancy: vacancy)
                        
                    Spacer().frame(height: 8)
                }
            }
            .scrollIndicators(.never)
        }
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.uiBlack)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView().environmentObject(AppViewModel())
    }
}
