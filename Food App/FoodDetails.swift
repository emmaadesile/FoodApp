
//  FoodDetails.swift
//  Food App
//
//  Created by Emmanuel Adesile on 27/11/2019.
//  Copyright © 2019 Emmanuel Adesile. All rights reserved.


import SwiftUI

struct FoodDetails: View {
//  @Binding var showFoodDetail : Bool
  var image = "food1"
  var foodName = "Grilled Salmon"
  var price = "$96.00"
  var detail = "Looading.."
  var review = ""
  
  var body: some View {
    VStack {
      ZStack {
        
        Image(image)
          .resizable()
          .aspectRatio(contentMode: .fill)
        
        Image(systemName: "xmark.circle.fill")
          .resizable()
          .frame(width: 32, height: 32)
          .foregroundColor(Color.white)
          .shadow(color: .gray, radius: 2, x: 2, y: 2)
          .padding(.leading, 350)
          .padding(.bottom, 260)
//          .onTapGesture {
//            self.showFoodDetail.toggle()
//        }
      }
      .frame(height: 278.0)
      
      VStack {
        VStack{
          HStack {
            Text(foodName)
              .font(.title)
              .fontWeight(.semibold)
            
            Spacer()
            Text(price)
            .foregroundColor(Color("coolRed"))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          }
          .padding(.horizontal, 15.0)
          .padding(.top, 20)
          
          HStack {
            Text("by Pizza Hut")
              .font(.footnote)
              .foregroundColor(Color("textGray"))
            Spacer()
          }
          .padding(.leading, 15.0)
          .padding(.bottom, 5.0)
          
          HStack(spacing: 15.0) {
            Image(systemName: "minus")
              .frame(width: 38, height: 38)
            
            VStack {
              Text("Add to Bag")
                .fontWeight(.semibold)
                .foregroundColor(.white)
            }
            .frame(width: 180, height: 40)
            .background(Color("coolRed"))
            .cornerRadius(5.0)
            
            Image(systemName: "plus")
              .frame(width: 38, height: 38)
          }
          
          VStack(alignment: .leading) {
            Text("DETAILS")
              .foregroundColor(Color("coolRed"))
              .padding(.top, 20.0)
            
            Text("A simple soy sauce and brown sugar marinade, with hints of lemon and garlic, are the perfect tasty and sweet-salty complement to rich salmon fillets. Even my 9 year old loves this recipe. There’s no healthier, easier, or faster summer entree than a perfect piece of grilled salmon. This 15-minute recipe is a staple in our regular dinner routine.")
              .font(.footnote)
              .padding(.top, 10)
            
            Text("REVIEWS")
              .foregroundColor(Color("coolRed"))
              .padding(.top, 20.0)
            
            HStack(alignment: .center) {
              Image("reviewer")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)

                Text("Jesse Craig")
                  .font(.subheadline)
            }
          
            HStack {
              ForEach(0..<5) { star in
                Image(systemName: "star.fill")
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundColor(Color("coolRed"))
              }
            }
       
           Text("Dec 20, 2019")
             .font(.footnote)
             .foregroundColor(Color("textGray"))
            
            
            Text("This is one of the best meals I’ve had in a long time.  Its rich in fibre and protein and the salmon was fresh.")
              .font(.footnote)
              .padding(.vertical, 20.0)
            
          }
          .frame(minWidth: 0, maxWidth: .infinity)
          .padding(.horizontal, 15.0)
          
        }
        .background(Color.white)
        .cornerRadius(6.0)
        .shadow(radius: 15, x: 0, y: 2)
        .offset(x: 0, y: -20)
      }
      .padding(.horizontal, 30.0)
      .background(Color.white)
      Spacer()
    }
  }
}

struct FoodDetails_Previews: PreviewProvider {
  static var previews: some View {
    FoodDetails()
  }
}
