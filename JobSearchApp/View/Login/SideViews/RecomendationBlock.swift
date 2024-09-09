//
//  RecomendationBlock.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 11.04.2024.
//

import SwiftUI

struct RecomendationBlock: View {

        private let imageName: String
        private let backgroundColor: Color
        private let title: LocalizedStringKey
        private let buttonTitle: LocalizedStringKey?
       
        init(imageName: String,
             imageBackground: Color = .uiGray4,
             title: LocalizedStringKey,
             buttonTitle: LocalizedStringKey? = nil) {
            self.imageName = imageName
            self.backgroundColor = imageBackground
            self.title = title
            self.buttonTitle = buttonTitle
        }
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Image(imageName)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .background(Color.uiGray1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 16)
                Text(title)
                    .fontTitle4()
                    .foregroundStyle(.white)
                    .tracking(-0.1)
                if let buttonTitle = buttonTitle {
                    Text(buttonTitle)
                        .fontTitle4()
                        .foregroundStyle(Color.uiGreen)
                }
                Spacer(minLength: 0)
            }
            .padding(8)
            .frame(width: 132 ,height: 120)
            .background(Color.uiGray1, in: RoundedRectangle(cornerRadius: 8))
        }
    }

struct RecomendationBlock_Previews: PreviewProvider {
    static var previews: some View {
        RecomendationBlock(imageName: "Вакансии рядом", title: "Вакансии рядом c вами")
    }
}

