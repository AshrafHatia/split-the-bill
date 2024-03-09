//
//  SideMenuOptionModel.swift
//  SplitTheBill
//
//  Created by Ashraf Hatia on 05/03/24.
//

import Foundation
import SwiftUI

enum SideMenuOptionModel:Int, CaseIterable{
    case main
    case notification
    case chart
    case contact
    case about
    
    
    var title : String {
        switch self {
        case .main:
            return "Home"
        case .notification:
            return "Notification"
        case .chart:
            return "Chart"
        case .contact:
            return "Contact Us"
        case .about:
            return "About"
        }
    }
    
    var systemImageName : String {
        switch self {
        case .main:
            return "filemenu.and.cursorarrow"
        case .notification:
            return "bell"
        case .chart:
            return "chart.bar"
        case .contact:
            return "square.and.pencil.circle"
        case .about:
            return "info.square"
        }
    }
 
    var pageTitle : String {
        switch self {
        case .main:
            return "Split the Bill"
        case .notification:
            return "Notification"
        case .chart:
            return "Chart"
        case .contact:
            return "Contact Us"
        case .about:
            return "About"
        }
    }
    
    var viewPage : AnyView {
        switch self {
        case .main:
            return AnyView(MainView())
        case .notification:
            return AnyView(NotificationView())
        case .chart:
            return AnyView(PieChartView())
        case .contact:
            return AnyView(ContactUsView())
        case .about:
            return AnyView(AboutView())
        }
    }

}

extension SideMenuOptionModel: Identifiable {
    var id: Int { return  self.rawValue }
}
