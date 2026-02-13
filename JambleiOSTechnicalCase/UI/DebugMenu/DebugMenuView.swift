//
//  DebugMenuView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import SwiftUI

struct DebugMenuView: View {

    @StateObject var vm: DebugMenuViewModel

    @Environment(\.dismiss) private var dismiss

    init() {
        _vm = StateObject(wrappedValue: DebugMenuViewModel())
    }

    var body: some View {

        ScrollView {

            VStack {
                
                Text("DEBUG MENU")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundStyle(.blue)
                
                Spacer()
                    .frame(height: 15)
                
                Text("Intentional delays")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundStyle(.red)
                
                Text("Délais intentionnels")
                    .font(.system(size: 17))
                    .foregroundStyle(.red)
                
                Spacer()
                    .frame(height: 35)

                Text("SELECT THE DELAY TO FETCH LIVESTREAMS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Sélectionnez le délai pour récupérer les livestreams")
                    .font(.system(size: 9))

                HStack {

                    Button("None") {
                        DebugSettings.delayFetchLivestreams = 0
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchLivestreams == 0
                            ? .bold : .ultraLight
                    )

                    Button("1s") {
                        DebugSettings.delayFetchLivestreams = 1_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchLivestreams == 1_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("2s") {
                        DebugSettings.delayFetchLivestreams = 2_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchLivestreams == 2_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("3s") {
                        DebugSettings.delayFetchLivestreams = 3_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchLivestreams == 3_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("5s") {
                        DebugSettings.delayFetchLivestreams = 5_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchLivestreams == 5_000_000_000
                            ? .bold : .ultraLight
                    )

                }
                .padding(.bottom, 20)
                
                Text("SELECT THE DELAY TO FETCH REVIEWS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Sélectionnez le délai pour récupérer les avis")
                    .font(.system(size: 9))

                HStack {

                    Button("None") {
                        DebugSettings.delayFetchReviews = 0
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchReviews == 0
                            ? .bold : .ultraLight
                    )

                    Button("1s") {
                        DebugSettings.delayFetchReviews = 1_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchReviews == 1_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("2s") {
                        DebugSettings.delayFetchReviews = 2_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchReviews == 2_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("3s") {
                        DebugSettings.delayFetchReviews = 3_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchReviews == 3_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("5s") {
                        DebugSettings.delayFetchReviews = 5_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchReviews == 5_000_000_000
                            ? .bold : .ultraLight
                    )

                }
                .padding(.bottom, 20)
                
                Text("SELECT THE DELAY TO FETCH USER REVIEW INFO")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Sélectionnez le délai pour récupérer les informations de l’avis utilisateur")
                    .font(.system(size: 9))

                HStack {

                    Button("None") {
                        DebugSettings.delayFetchUserReviewInfo = 0
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserReviewInfo == 0
                            ? .bold : .ultraLight
                    )

                    Button("1s") {
                        DebugSettings.delayFetchUserReviewInfo = 1_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserReviewInfo == 1_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("2s") {
                        DebugSettings.delayFetchUserReviewInfo = 2_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserReviewInfo == 2_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("3s") {
                        DebugSettings.delayFetchUserReviewInfo = 3_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserReviewInfo == 3_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("5s") {
                        DebugSettings.delayFetchUserReviewInfo = 5_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserReviewInfo == 5_000_000_000
                            ? .bold : .ultraLight
                    )

                }
                .padding(.bottom, 20)
                
                Text("SELECT THE DELAY TO FETCH BOOKMARKS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Sélectionnez le délai pour récupérer les favoris")
                    .font(.system(size: 9))

                HStack {

                    Button("None") {
                        DebugSettings.delayFetchBookmarks = 0
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchBookmarks == 0
                            ? .bold : .ultraLight
                    )

                    Button("1s") {
                        DebugSettings.delayFetchBookmarks = 1_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchBookmarks == 1_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("2s") {
                        DebugSettings.delayFetchBookmarks = 2_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchBookmarks == 2_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("3s") {
                        DebugSettings.delayFetchBookmarks = 3_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchBookmarks == 3_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("5s") {
                        DebugSettings.delayFetchBookmarks = 5_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchBookmarks == 5_000_000_000
                            ? .bold : .ultraLight
                    )

                }
                .padding(.bottom, 20)
                
                Text("SELECT THE DELAY TO FETCH YOUR PROFILE")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Sélectionnez le délai pour récupérer votre profil")
                    .font(.system(size: 9))

                HStack {

                    Button("None") {
                        DebugSettings.delayFetchUserProfile = 0
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserProfile == 0
                            ? .bold : .ultraLight
                    )

                    Button("1s") {
                        DebugSettings.delayFetchUserProfile = 1_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserProfile == 1_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("2s") {
                        DebugSettings.delayFetchUserProfile = 2_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserProfile == 2_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("3s") {
                        DebugSettings.delayFetchUserProfile = 3_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserProfile == 3_000_000_000
                            ? .bold : .ultraLight
                    )

                    Button("5s") {
                        DebugSettings.delayFetchUserProfile = 5_000_000_000
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.delayFetchUserProfile == 5_000_000_000
                            ? .bold : .ultraLight
                    )

                }
                .padding(.bottom, 20)
                
                Divider()
                
                Text("Intentional errors")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundStyle(.red)
                
                Text("Erreurs intentionnelles")
                    .font(.system(size: 17))
                    .foregroundStyle(.red)
                
                Spacer()
                    .frame(height: 35)
                
                Text("FORCE ERROR ON FETCHING LIVESTREAMS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Forcer une erreur lors de la récupération des livestreams")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.forceErrorFetchLivestreams = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchLivestreams == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.forceErrorFetchLivestreams = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchLivestreams == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Text("FORCE ERROR ON FETCHING REVIEWS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Forcer une erreur lors de la récupération des avis")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.forceErrorFetchReviews = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchReviews == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.forceErrorFetchReviews = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchReviews == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Text("FORCE ERROR ON FETCHING USER INFO REVIEWS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Forcer une erreur lors de la récupération des avis utilisateur")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.forceErrorFetchUserReviewInfo = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchUserReviewInfo == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.forceErrorFetchUserReviewInfo = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchUserReviewInfo == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Text("FORCE ERROR ON FETCHING BOOKMARKS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Forcer une erreur lors de la récupération des favoris")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.forceErrorFetchBookmarks = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchBookmarks == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.forceErrorFetchBookmarks = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchBookmarks == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Text("FORCE ERROR ON FETCHING PROFILE")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Forcer une erreur lors de la récupération de votre profil")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.forceErrorFetchProfile = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchProfile == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.forceErrorFetchProfile = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.forceErrorFetchProfile == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Divider()
                
                Text("Empty results")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundStyle(.red)
                
                Text("Résultats vides")
                    .font(.system(size: 17))
                    .foregroundStyle(.red)
                
                Spacer()
                    .frame(height: 35)
                
                Text("EMPTY RESULTS FOR LIVESTREAMS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Résultats vides pour les livestreams")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.noResultsForLivestreams = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.noResultsForLivestreams == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.noResultsForLivestreams = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.noResultsForLivestreams == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Text("EMPTY RESULTS FOR REVIEWS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Résultats vides pour les avis")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.noResultsForReviews = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.noResultsForReviews == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.noResultsForReviews = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.noResultsForReviews == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 20)
                
                Text("EMPTY RESULTS FOR BOOKMARKS")
                    .font(.system(size: 15))
                    .bold()
                
                Text("Résultats vides pour les favoris")
                    .font(.system(size: 9))

                HStack {

                    Button("Yes") {
                        DebugSettings.noResultsForBookmarks = true
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.noResultsForBookmarks == true
                            ? .bold : .ultraLight
                    )
                    
                    Button("No") {
                        DebugSettings.noResultsForBookmarks = false
                        dismiss()
                    }
                    .fontWeight(
                        DebugSettings.noResultsForBookmarks == false
                            ? .bold : .ultraLight
                    )

                    

                }
                .padding(.bottom, 40)
                
                

            }

        }
        .foregroundStyle(.black)

    }
}
