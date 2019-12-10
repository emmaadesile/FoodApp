//
//  ContentView.swift
//  Food App
//
//  Created by Emmanuel Adesile on 20/11/2019.
//  Copyright © 2019 Emmanuel Adesile. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State var showFoodDetail = false
  var foods = foodsData
  var popularMenu = popularFoods
  
  var body: some View {
    ZStack {
      
      VStack {
        TopView()
        
        HStack() {
          ForEach(foods) { item in
            FoodTop(name: item.name, image: item.image)
          }
        }
        
        VStack {
          HStack {
            Text("Popular Foods")
              .font(.headline)
              .fontWeight(.semibold)
            Spacer()
          }
          .padding(.leading, 15.0)
          .padding(.top, 5.0)
          
          ScrollView(.horizontal, showsIndicators: false) {
             HStack(spacing: 18.0) {
               ForEach(popularMenu) { food in
                 PopularFoodView(
                   name: food.name,
                   image: food.image,
                   rating: food.rating,
                   price: food.price,
                   likeIcon: food.likeIcon
                 )
                   .onTapGesture {
                     self.showFoodDetail.toggle()
                 }
               }
             }
             .padding()
           }
        }
        
        FoodBottomView()
        
        Spacer()
      }
      .background(Color.white)
      .animation(.default)
      .scaleEffect(showFoodDetail ? 0.90 : 1)
      
      FoodDetails()
        .offset(y: showFoodDetail ? 30 : UIScreen.main.bounds.height + 50)
        .cornerRadius(20)
        .animation(.spring())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Food: Identifiable {
  var id = UUID()
  var name : String
  var image : String
}

let foodsData = [
  Food(name: "Fruits", image: "fruits"),
  Food(name: "Ice cream", image: "icecream"),
  Food(name: "Sushi", image: "sushi"),
  Food(name: "Steak", image: "steak"),
  Food(name: "Fast Food", image: "smoothies"),
]

struct FoodTop: View {
  var name : String
  var image : String
  
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .frame(width: 40, height: 40)
        .cornerRadius(5)
        .shadow(color: Color("coolRedShadow"), radius: 3, x: 0, y: 2)
      Text(name)
        .font(.caption)
        .padding(.top, 8)
        .foregroundColor(Color("myGray"))
        .frame(width: 60)
    }
    .frame( width: 75.0, height: 120)
  }
}

struct PopularFood: Identifiable {
  var id = UUID()
  var name: String
  var image : String
  var rating : String
  var price : String
  var detail: String?
  var review: String?
  var likeIcon: String
}

struct PopularFoodView: View {
  var name: String
  var image: String
  var rating: String
  var price: String
  var detail: String?
  var review: String?
  var likeIcon: String
  
  var body: some View {
    VStack {
      ZStack {
        Image(image)
          .resizable()
          .renderingMode(.original)
          .aspectRatio(contentMode: .fill)
        
        HStack {
          Spacer()
          Image(systemName: likeIcon)
            .foregroundColor(Color("coolRed"))
            .frame(width: 25, height: 25)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
        .padding(.bottom, 180.0)
        .padding(.trailing, 5.0)
      }
      
      VStack {
        HStack {
          Text(name)
            .font(.footnote)
            .foregroundColor(Color("myGray"))
            .multilineTextAlignment(.leading)
          Spacer()
          Text(price)
            .font(.footnote)
            .foregroundColor(Color.black)
            .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
        }
        
        HStack {
          Text(rating)
            .font(.footnote)
            .foregroundColor(Color("gray2"))
          Spacer()
        }
      }
      .background(Color.white)
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.horizontal, 2.0)
    }
  }
}

let popularFoods = [
  PopularFood(name: "Grilled Salmon", image: "food2", rating: "4.9", price: "$96.00", detail: "A simple soy sauce and brown sugar marinade, with hints of lemon and garlic, are the perfect tasty and sweet-salty complement to rich salmon fillets. Even my 9 year old loves this recipe. There’s no healthier, easier, or faster summer entree than a perfect piece of grilled salmon. This 15-minute recipe is a staple in our regular dinner routine, and I’m so excited to share my tips with you today!", likeIcon: "heart.fill"),
  PopularFood(name: "Lettuce Pasta", image: "food1", rating: "4.2", price: "$80.00", detail: "A simple soy sauce and brown sugar marinade, with hints of lemon and garlic, are the perfect tasty and sweet-salty complement to rich salmon fillets. Even my 9 year old loves this recipe. There’s no healthier, easier, or faster summer entree than a perfect piece of grilled salmon. This 15-minute recipe is a staple in our regular dinner routine, and I’m so excited to share my tips with you today!", likeIcon: "heart.fill"),
  PopularFood(name: "Rissoto Bowl", image: "food3", rating: "3.2", price: "$74.00",detail: "A simple soy sauce and brown sugar marinade, with hints of lemon and garlic, are the perfect tasty and sweet-salty complement to rich salmon fillets. Even my 9 year old loves this recipe. There’s no healthier, easier, or faster summer entree than a perfect piece of grilled salmon. This 15-minute recipe is a staple in our regular dinner routine, and I’m so excited to share my tips with you today!",  likeIcon: "heart.fill"),
  PopularFood(name: "Toast with Omellete", image: "food4", rating: "3.3", price: "$83.55", detail: "A simple soy sauce and brown sugar marinade, with hints of lemon and garlic, are the perfect tasty and sweet-salty complement to rich salmon fillets. Even my 9 year old loves this recipe. There’s no healthier, easier, or faster summer entree than a perfect piece of grilled salmon. This 15-minute recipe is a staple in our regular dinner routine, and I’m so excited to share my tips with you today!", likeIcon: "heart.fill")
]

struct TopView: View {
  var body: some View {
    HStack {
      Text("What would you like to eat ?")
        .font(.subheadline)
        .fontWeight(.medium)
      Spacer()
      Image(systemName: "bell")
        .frame(width: 30, height: 30)
    }
    .padding(.horizontal, 15)
  }
}

struct FoodBottomView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Best Food of the Week")
          .font(.headline)
          .fontWeight(.semibold)
        Spacer()
      }
      .padding(.top, 20)
      .padding(.leading, 15.0)
      
      Image("bestFood")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 415, height: 295)
    }
  }
}
