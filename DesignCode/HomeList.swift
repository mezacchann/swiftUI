//
//  HomeList.swift
//  DesignCode
//
//  Created by Meza Rodriguez Jeany Sergei on 2019/10/29.
//  Copyright © 2019 Meza Rodriguez Jeany Sergei. All rights reserved.
//

import SwiftUI

struct HomeList: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Build an app with SwiftUI")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(Color.white)
        .padding(20)
        .lineLimit(4)
        .frame(width: 180)
      Spacer()
      Image("Illustration1")
    }
    .background(Color("background3"))
  .cornerRadius(30)
    .frame(width: 246, height: 360)
  }
}

struct HomeList_Previews: PreviewProvider {
  static var previews: some View {
    HomeList()
  }
}
