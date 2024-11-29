//
//  Font+Ext.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 5/11/24.
//

import SwiftUI

extension Font {
    public static func system(
        size: CGFloat,
        weight: UIFont.Weight,
        width: UIFont.Width) -> Font
    {
        return Font(
            UIFont.systemFont(
                ofSize: size,
                weight: weight,
                width: width)
        )
    }
}
