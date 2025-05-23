//
//  MakeReviewCell.swift
//  Munch!
//
//  Created by Andrew Gao on 5/1/25.
//
import SwiftUI

struct MakeReviewCell: View {
    @Binding var rating: Int
    @Binding var message: String
    var onPost: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Review input
            TextField("🤔 How was this food?", text: $message)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)

            HStack {
                // Star rating
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(index <= rating ? .yellow : .gray)
                        .onTapGesture {
                            rating = index
                        }
                }

                Spacer()

                // Post button
                Button(action: onPost) {
                    Text("Post")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 115, height: 40)
                        .background(Color(UIColor.munch.beige).opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 0)
        .padding(.horizontal)
    }
}
