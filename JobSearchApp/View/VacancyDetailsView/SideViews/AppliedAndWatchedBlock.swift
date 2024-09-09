//
//  AppliedAndWatchedBlock.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 16.04.2024.
//

import SwiftUI

struct AppliedAndWatchedBlock: View {

    private let imageName: String
    private let number: Int
    private let title: String
           
    init(imageName: String, number: Int,title: String) {
                self.imageName = imageName
                self.number = number
                self.title = title
        }
            
    var body: some View {
        HStack (alignment: .top) {
            Text("\(number) \(title)")
                .fontText1()
                .foregroundStyle(.white)
            
            Spacer()
                
            Image(imageName)
        }
        .padding(.horizontal, 8)
        .frame(height: 50)
        .background(Color.uiDarkGreen, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct AppliedAndWatchedBlock_Previews: PreviewProvider {
    static var previews: some View {
        AppliedAndWatchedBlock(imageName: "Смотрят", number: 122, title: "человек уже откликнулись")
    }
}
