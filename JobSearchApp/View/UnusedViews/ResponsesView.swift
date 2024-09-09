//
//  ResponsesView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct ResponsesView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Отклики")
                .foregroundColor(.uiWhite)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.uiBlack)
    }
}


struct ResponsesView_Previews: PreviewProvider {
    static var previews: some View {
        ResponsesView()
    }
}
