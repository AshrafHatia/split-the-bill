//
//  SideMenuHeaderView.swift
//  SplitTheBill
//
//  Created by Ashraf Hatia on 04/03/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "square.split.2x1.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48,height: 48)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            VStack(alignment: .leading, spacing: 6) {
                Text("Split The Bill")
                    .font(.subheadline)
                Text("ashrafhatia@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
