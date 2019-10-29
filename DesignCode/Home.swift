//
//  HomeView.swift
//  DesignCode
//
//  Created by Meza Rodriguez Jeany Sergei on 2019/10/29.
//  Copyright © 2019 Meza Rodriguez Jeany Sergei. All rights reserved.
//

import SwiftUI

struct Home: View {
  @State var show = false
  @State var showProfile = false
  
  var body: some View {
    ZStack {
      ContentView()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .animation(.interactiveSpring())
        .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
      
      MenuButton(show: $show)
        .offset(x: -30, y: showProfile ? 0 : 80)
        .animation(.spring())
      MenuRight(show: $showProfile)
        .offset(x: -16, y: showProfile ? 0 : 88)
        .animation(.spring())
      MenuView(show: $show)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct MenuRow: View {
  var image = "creditcard"
  var text = "My Account"
  
  var body: some View {
    HStack {
      Image(systemName: image)
        .imageScale(.large)
        .foregroundColor(Color("icons"))
        .frame(width:32, height: 32)
      Text(text)
        .font(.headline)
      Spacer()
    }
  }
}

struct Menu: Identifiable {
  var id: String
  var title: String
  var icon: String
}

let menuData = [
  Menu(id: "account", title: "My Account", icon: "person.crop.circle"),
  Menu(id: "billing", title: "Billing", icon: "creditcard"),
  Menu(id: "team", title: "Team", icon: "person.2"),
  Menu(id: "signout", title: "Sign out", icon: "arrow.uturn.down"),
]

struct MenuView: View {
  var menu = menuData
  @Binding var show: Bool
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      ForEach(menu) { item in
        MenuRow(image: item.icon, text: item.title)
      }
      Spacer()
    }
    .padding(.top, 20)
    .padding(30)
    .frame(minWidth: 0, maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
    .padding(.trailing, 60)
    .shadow(radius: 20)
    .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
    .animation(.default)
    .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    .onTapGesture {
      self.show.toggle()
    }
  }
}

struct CircleButton: View {
  var icon = "person.crop.circle"
  
  var body: some View {
    HStack {
      Image(systemName: icon)
        .foregroundColor(.black)
    }
    .frame(width: 44, height: 44)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
  }
}

struct MenuButton: View {
  @Binding var show: Bool
  
  var body: some View {
    VStack {
      HStack {
        Button(action: { self.show.toggle() }) {
          HStack {
            Spacer()
            Image(systemName: "list.dash")
              .foregroundColor(.black)
          }
          .padding(.trailing, 20.0)
          .frame(width: 90, height: 60)
          .background(Color.white)
          .cornerRadius(30)
          .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
        }
        Spacer()
      }
      Spacer()
    }
  }
}

struct MenuRight: View {
  @Binding var show: Bool
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        HStack {
          Button(action: { self.show.toggle() }) {
            CircleButton(icon: "person.crop.circle")
          }
          Button(action: { self.show.toggle() }) {
            CircleButton(icon: "bell")
          }
        }
      }
      Spacer()
    }
  }
}
