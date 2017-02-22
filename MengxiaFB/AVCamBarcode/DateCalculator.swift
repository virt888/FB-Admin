//
//  DateCalculator.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import Foundation

class DateCalculator {
    static var calendar = Calendar.current

    
    static func getDateComponents(_ date: Date) -> DateComponents {
        calendar.locale = Locale(identifier: "en_US")
        calendar.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        return calendar.dateComponents([Calendar.Component.year,.month,.day,.weekday,.weekOfMonth,.hour,.minute,.second], from: date)
    }
    
    static func getYear(date: Date) -> Int {
        return getDateComponents(date).year!
    }
    
    static func getDayStartMoment(date: Date) -> Date {
        var dateComponents = getDateComponents(date)
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        calendar.locale = Locale(identifier: "en_US")
        calendar.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        return calendar.date(from: dateComponents)!
    }
    
    static func getDayEndMoment(date: Date) -> Date {
        var dateComponents = getDateComponents(date)
        dateComponents.hour = 23
        dateComponents.minute = 59
        dateComponents.second = 59
        calendar.locale = Locale(identifier: "en_US")
        calendar.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        return calendar.date(from: dateComponents)!
    }
    
    static func getMonth(date: Date) -> Int {
        return getDateComponents(date).month!
    }
    
    static func getDay(date: Date) -> Int {
        return getDateComponents(date).day!
    }
    static func getWeekDay(date: Date) -> Int {
        return getDateComponents(date).weekday!
    }
    
    static func firstWeekDayOfMonth(index:Int ) -> Int {
        
        return getDateComponents(FirstDayOfMonth(index: index)).weekday!
    }
    
    static func weeksOfMonth(date: Date) -> Int {
        calendar.locale = Locale(identifier: "en_US")
        calendar.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        return calendar.ordinality(of: .weekday, in: .weekOfMonth, for: date)!
    }
    
    static func daysOfMonth(index: Int) -> Int {
        calendar.locale = Locale(identifier: "en_US")
        calendar.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        let nextMonth = calendar.date(byAdding: .month, value: 1, to: FirstDayOfMonth(index: index))
        let lastDay = calendar.date(byAdding: .day, value: -1, to: nextMonth!)
        return getDay(date: lastDay!)
    }
    
    static func getMonth(index: Int) -> Int {
        return getMonth(date: FirstDayOfMonth(index: index))
    }
    
    static func FirstDayOfMonth(index: Int) -> Date {
        calendar.locale = Locale(identifier: "en_US")
        calendar.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        var componte = getDateComponents(getDayStartMoment(date: Date()))
        componte.day = 1
        componte.month = (componte.month! + index) % 12
        componte.year = componte.year! + index/12
        return calendar.date(from: componte)!
    }
    
    static func IsEqualDate(date: Date, compareTo: Date) -> Bool {
        if getYear(date: date) == getYear(date: compareTo) {
            if getMonth(date: date) == getMonth(date: compareTo){
                if getDay(date: date) == getDay(date: compareTo) {
                    return true
                }
            }
        }
        
        return false
    }
    
    static let yyyyDf:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
    
    static let mmmmDf:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
    
    static let mmmDf:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
    
    static let ddDf:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
    
    static let eeeDf:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
    
    static let yyyyMMddhhmmss:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
    
    static let ddMMMyyyy:  DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")!
        
        return formatter
    }()
}
