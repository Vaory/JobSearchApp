//
//  TextExtensions.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 06.04.2024.
//

import SwiftUI

extension Text {
    
    // Кастомные шрифты согласно макету
    
    func fontTitle1() -> Text {
        return self.font(Font.custom("SFProDisplay-Semibold", size: 22))
    }
    
    func fontTitle2() -> Text {
        return self.font(Font.custom("SFProDisplay-Semibold", size: 20))
    }
    
    func fontTitle3() -> Text {
        return self.font(Font.custom("SFProDisplay-Medium", size: 16))
    }
    
    func fontTitle4() -> Text {
        return self.font(Font.custom("SFProDisplay-Medium", size: 14))
    }
    
    func fontText1() -> Text {
        return self.font(Font.custom("SFProDisplay-Regular", size: 14))
    }
    
    func fontButtonText1 () -> Text {
        return self.font(Font.custom("SFProDisplay-Semibold", size: 16))
    }
    
    func fontButtonText2 () -> Text {
        return self.font(Font.custom("SFProDisplay-Regular", size: 14))
    }
    
    func fontTabText () -> Text {
        return self.font(Font.custom("SFProDisplay-Regular", size: 10))
    }
    
    func fontNumber () -> Text {
        return self.font(Font.custom("SFProDisplay-Regular", size: 7))
    }
    
}
