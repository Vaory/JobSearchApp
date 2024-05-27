//
//  SearchView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorViewModel
    @EnvironmentObject private var viewModel: AppViewModel
    @State private var text = ""
    
    
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                    
                    TextField("", text: $text)
                        .offset(x:10)
                        .foregroundColor(.uiWhite)
                        .frame(height: 40)
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .autocorrectionDisabled()
                        .foregroundColor(.uiWhite)
                        .colorScheme(.dark)
                        .background(Color.uiGrey2)
                        .cornerRadius(8)
                        .disabled(true)
                            
                    HStack {
                        Image("Поиск")
                                        
                        Spacer().frame(width: 8)
                                    
                        Text("Должность, ключевые слова")
                            .fontText1()
                            .foregroundColor(.uiGrey4)
                        Spacer()
                        }.allowsHitTesting(false)
                                .padding(.leading, 8)
                    }
                    Spacer().frame(width: 8)
                
                    Image("searchFilter")
                }
            ScrollView(.horizontal) {
                                   LazyHStack(spacing: DrawingConstants.standardSpacing) {
                                       OfferBlock(
                                           imageName: "location",
                                           imageBackground: .accentDisabled,
                                           title: "Vacancies near you"
                                       )
                                       OfferBlock(
                                           imageName: "star",
                                           imageBackground: .saladDisabled,
                                           title: "Boost your resume in the search",
                                           buttonTitle: "Boost"
                                       )
                                       OfferBlock(
                                           imageName: "note",
                                           imageBackground: .saladDisabled,
                                           title: "Temporary and part-time work"
                                       )
                                   }
                               }.scrollIndicators(.never)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.uiBlack)
                
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
