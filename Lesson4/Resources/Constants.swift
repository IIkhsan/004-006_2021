//
//  Constants.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import Foundation

enum Constants: String {
    // Seque для перехода на контроллер новостей
    case feedsSeque = "goFeedsSegue"
    // Seque для перехода на контроллер детального просмотра
    case detailedPostSeque = "goDetailedPost"
    // Seque для перехода на контроллер изменения данных
    case editingAccountSeque = "goEditingAccountSegue"
    // Имя пустого лайка
    case likeName = "like"
    // Имя filled лайка
    case dislikeName = "filled_like"
}
