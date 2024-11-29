//
//  Date+Ext.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 9/11/24.
//

import SwiftUI

extension UIDatePicker {
    open override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric,
               height: super.intrinsicContentSize.height)
    }
}
