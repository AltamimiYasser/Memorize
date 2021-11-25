//
//  Theme.swift
//  Memorize
//
//  Created by Yasser Tamimi on 25/11/2021.
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let numbersOfPairOfCards: Int
    let color: String

    static let vehiclesEmojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚",
        "🚛", "🚜", "🚍", "🚘", "🚖", "🚇", "🚊", "🛵", "🏍", "🛺", "🚨", "🚔"
    ]
    static let vehiclesTheme = Theme(name: "vehicles",
                                     emojis: vehiclesEmojis ,
                                     numbersOfPairOfCards: vehiclesEmojis.count,
                                     color: "red")

    static let facesEmojis = [
        "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇",
        "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛"
    ]
    static let facesTheme = Theme(name: "faces",
                                  emojis: facesEmojis,
                                  numbersOfPairOfCards: facesEmojis.count,
                                  color: "yellow")

    static let flagsEmojis = [
        "🏳️", "🏴", "🏁", "🚩", "🏳️‍⚧️", "🏴‍☠️", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩",
        "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭"
    ]
    static let flagsTheme = Theme(name: "flags",
                                  emojis: flagsEmojis,
                                  numbersOfPairOfCards: flagsEmojis.count,
                                  color: "blue")

    static let handsEmojis = [
        "👋", "🤚", "🖐", "✋", "🖖", "👌", "🤌", "🤏", "✌️", "🤞", "🤟", "🤘",
        "🤙", "👈", "👉", "👆", "🖕", "👇", "☝️", "👍", "👎", "✊", "👊", "🤛"
    ]
    static let handsTheme = Theme(name: "hands",
                                  emojis: handsEmojis,
                                  numbersOfPairOfCards: handsEmojis.count,
                                  color: "brown")

    static let peopleEmojis = [
        "👶", "👧", "🧒", "👦", "👩", "🧑", "👨", "👩‍🦱", "🧑‍🦱", "👨‍🦱", "👩‍🦰", "🧑‍🦰",
        "👨‍🦰", "👱‍♀️", "👱", "👱‍♂️", "👩‍🦳", "🧑‍🦳", "👨‍🦳", "👩‍🦲", "🧑‍🦲", "👨‍🦲", "🧔", "👵"
    ]
    static let peopleTheme = Theme(name: "people",
                                   emojis: peopleEmojis,
                                   numbersOfPairOfCards: peopleEmojis.count,
                                   color: "orange")

    static let clothingEmojis = [
        "🧳", "🌂", "☂️", "🧵", "🪡", "🪢", "🧶", "👓", "🕶", "🥽", "🥼", "🦺",
        "👔", "👕", "👖", "🧣", "🧤", "🧥", "🧦", "👗", "👘", "🥻", "🩴", "🩱"
    ]
    static let clothingTheme = Theme(name: "clothing",
                                     emojis: clothingEmojis,
                                     numbersOfPairOfCards: clothingEmojis.count,
                                     color: "purple")
    
    static func getTheme() -> Theme {
        let themes = [vehiclesTheme, facesTheme, flagsTheme, handsTheme, peopleTheme, clothingTheme]
        return themes.randomElement()!
    }
}
