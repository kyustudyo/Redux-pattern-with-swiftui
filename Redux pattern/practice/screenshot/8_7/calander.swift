//
//  ViewController.swift
//  fgfgffff
//
//  Created by Hankyu Lee on 2022/08/07.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    var events: [Date] = []
    var events2: [Date] = []
    var calendar = FSCalendar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        calendar.dataSource = self
        
        view.addSubview(calendar)

//        calendar.appearance.eventDefaultColor = UIColor(red: 213/255, green: 207/255, blue: 248/255, alpha: 1)
        
        
//        calendar.appearance.selectionColor = UIColor.blue
        calendar.appearance.todayColor = UIColor(red: 113/255, green: 87/255, blue: 219/255, alpha: 1)
        calendar.appearance.todaySelectionColor = UIColor.systemPink
        
        calendar.allowsSelection = false
        self.calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
//        calendar.headerHeight = 36
        calendar.headerHeight = 80
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 18)
        calendar.appearance.weekdayTextColor = .systemGray2
        
//        let label1 = UILabel()
//        label1.text = "qq"
//        view.addSubview(label1)
//        label1.anchor(left: calendar.leftAnchor, right: calendar.rightAnchor, paddingLeft: 0, paddingRight: 0)
//        label1.centerY(inView: calendar.calendarHeaderView)
        
        let previousButton = UIButton()
        previousButton.addTarget(self, action: #selector(previousTapped(_:)), for: .touchUpInside)
        view.addSubview(previousButton)
        previousButton.anchor(left: calendar.leftAnchor, paddingLeft: 16)
        previousButton.centerY(inView: calendar.calendarHeaderView)
        previousButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        previousButton.tintColor = .black
        
        let nextButton = UIButton()
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .touchUpInside)
        nextButton.tintColor = .black
        view.addSubview(nextButton)
        nextButton.anchor(right: calendar.rightAnchor, paddingRight: 16)
        nextButton.centerY(inView: calendar.calendarHeaderView)
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        calendar.calendarWeekdayView.weekdayLabels[0].text = "SUN"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "MON"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "TUE"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "WED"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "THU"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "FRI"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "SAT"
        calendar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 16, height: 300)
        calendar.placeholderType = .none//현재달만
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 13)
        
        setUpEvents()
    }

    func setUpEvents() {
        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
//        let xmas = formatter.date(from: "2020-12-25")
//        let sampledate3 = formatter.date(from: "2022-07-22")
//        let sampledate = formatter.date(from: "2020-08-22")
//        let sampledate2 = formatter.date(from: "2022-08-22")
        
        let sampledate5 = formatter.date(from: "2022-08-23")
        let sampledate6 = formatter.date(from: "2022-08-24")
//        events = [xmas!, sampledate!,sampledate2!,sampledate3!]
        events2 = [sampledate5!, sampledate6!]
    }
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

}
extension ViewController {
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        if self.events.contains(date){
//            return 1
//        }
//        if self.events2.contains(date){
//            return 2
//        }
//        return 0
//        }
//
          // Default Event Dot 색상 분기처리 - FSCalendarDelegateAppearance
//      func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]?{
//          if self.events.contains(date){
//              return [UIColor.red]
//          }
//
//          if self.events2.contains(date){
//              return [UIColor.black]
//          }
//
//          return nil
//      }
//
//    // 이벤트 누르면 변함
//      func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventSelectionColorsFor date: Date) -> [UIColor]? {
//          if self.events.contains(date){
//              return [UIColor.brown]
//          }
//
//          if self.events2.contains(date){
//              return [UIColor.yellow]
//          }
//          return nil
//      }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
            let eventScaleFactor: CGFloat = 1.8
            cell.eventIndicator.transform = CGAffineTransform(scaleX: eventScaleFactor, y: eventScaleFactor)
        }
        
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventOffsetFor date: Date) -> CGPoint {
            return CGPoint(x: 0, y: 3)
        }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date1 = formatter.string(from: date)
        let date2 = formatter.string(from: Date())
        
        if date1 == date2 {
            return .white
        } else if events2.contains(date) {
            return UIColor(red: 113/255.0, green: 87/255.0, blue: 219/255.0, alpha: 1)
        } else {
            return .black
        }

    }
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        return Date()
//    }
//
//    func minimumDate(for calendar: FSCalendar) -> Date {
//        return Date()
//    }
    @objc func nextTapped(_ sender:UIButton) {
        calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
    }

    @objc func previousTapped(_ sender:UIButton) {
        calendar.setCurrentPage(getPreviousMonth(date: calendar.currentPage), animated: true)
    }

    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to:date)!
    }

    func getPreviousMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to:date)!
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
        if events2.contains(date) {
            return UIColor(red: 213/255, green: 207/255, blue: 248/255, alpha: 1)
        }
//        if let color = self.fillDefaultColors[key] {
//            return UIColor.systemPink
//        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date))
        self.dismiss(animated: true, completion: nil)
    }

}

extension ViewController: FSCalendarDelegateAppearance {
    
}
//
//  ViewExtensioin.swift
//  ChungSungChungSung
//
//  Created by Hankyu Lee on 2022/08/06.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true

        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }

    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

}



