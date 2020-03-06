//
//  ChangePlayerView.swift
//  Score1031
//
//  Created by Danting Li on 3/2/20.
//  Copyright © 2020 HULUCave. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit


struct ChangePlayerView: View {
    
    @State var playerOneName = ""
    @State var playerOneEmoji = ""
    @State var playerTwoName = ""
    @State var playerTwoEmoji = ""
    @State var showAlert = false
    @State var showAlert2 = false


    @EnvironmentObject var nameAndScore: NameAndScore
    @EnvironmentObject var addEidtChoice: AddEidtChoice
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Record.getAllRecords()) var records: FetchedResults<Record>

    class TestButton: UIButton, UIKeyInput {

        var hasText: Bool = true

        override var textInputContextIdentifier: String? { "" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

        func insertText(_ text: String) { print("\(text)") }

        func deleteBackward() {}

        override var canBecomeFirstResponder: Bool { return true }

        override var canResignFirstResponder: Bool { return true }

        override var textInputMode: UITextInputMode? {
            for mode in UITextInputMode.activeInputModes {
                if mode.primaryLanguage == "emoji" {
                    return mode
                }
            }
            return nil
        }
    }
    var body: some View {
        VStack{
        HStack{
        TextField("playerOneName", text: $playerOneName)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.trailing, 35)
        .padding(.leading, 35)
        }
        HStack{
        TextField("playerOneEmoji", text: $playerOneEmoji)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.trailing, 35)
        .padding(.leading, 35)
        }
        HStack{
        TextField("playerTwoName", text: $playerTwoName)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.trailing, 35)
        .padding(.leading, 35)
        }
        HStack{
        TextField("playerTwoEmoji", text: $playerTwoEmoji)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.trailing, 35)
        .padding(.leading, 35)
        }
        HStack{
            Spacer()
            Button(action: {
                self.showAlert = true
                self.nameAndScore.playerOneName = self.playerOneName
                self.nameAndScore.playerTwoName = self.playerTwoName
                self.nameAndScore.playerOneEmoji = self.playerOneEmoji
                self.nameAndScore.playerTwoEmoji = self.playerTwoEmoji
                          
                           
            }) {
                Text("Change Players")
            }
            //.disabled($playerOneName.isEmpty)
                          // .disabled(Double(scoreEdited)  == nil)
            .alert(isPresented: $showAlert) { () ->
                Alert in
                return Alert(title: Text("Player Changed!"), message: Text("You changed player one to \(self.playerOneName), with emoji \(self.playerOneEmoji). You changed player two to  to \(self.playerTwoName), with emoji \(self.playerTwoEmoji)."), dismissButton: Alert.Button.default(Text("Ok"))
                    {self.presentationMode.wrappedValue.dismiss() }
                    )
                
            }
            }
        Spacer()
        Spacer()
        }
    }
}

struct ChangePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePlayerView()
    }
}
