//
//
//  MainLoginView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 04.04.2024.
//

import SwiftUI

struct MainLoginView: View {
                                                            
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("Вход в личный кабинет")
                .fontTitle2()
                .foregroundColor(.uiWhite)
            
            Spacer()
                
            EmploeeLogin()
            
            Spacer().frame(height: 22)
            
            EmployerLogin()
            
            Spacer()
            
        }
        .padding(.horizontal, 17)
        .padding(.top, 69)
        .edgesIgnoringSafeArea(.top)
        .background(Color.uiBlack)
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            MainLoginView()
        }
    }
}


