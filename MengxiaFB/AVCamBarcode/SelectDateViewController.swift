//
//  SelectDateViewController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class SelectDateViewController: BasicViewController {
    @IBOutlet weak var startDateLab: UILabel!
    @IBOutlet weak var endDateLab: UILabel!
    
    @IBOutlet weak var calendarCollection: UICollectionView!
    let calendar = Calendar(identifier: .chinese)
    var selectDate: ((_ startDate: Date?, _ endDate: Date?) -> ())?
    var lastSetIsStratDate: Bool = false
    var startDate: Date? {
        willSet(new) {
            startDateLab.text = DateCalculator.ddMMMyyyy.string(from: new!)
            lastSetIsStratDate = false
        }
    }
    var endDate: Date? {
        willSet(new) {
            endDateLab.text = DateCalculator.ddMMMyyyy.string(from: new!)
            lastSetIsStratDate = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select date range"
        calendarCollection.showsVerticalScrollIndicator = false
        calendarCollection.showsHorizontalScrollIndicator = false
        calendarCollection.delegate = self
        calendarCollection.dataSource = self
        calendarCollection.register(UINib.init(nibName: "DayCell", bundle: nil), forCellWithReuseIdentifier: "dayCell")
        calendarCollection.register(UINib.init(nibName: "MonthHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        barTitle = "Lookup history"
        
        
        let nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: "PingFang HK", size: 16)
        nextBtn.addTarget(self, action: #selector(gotoHistoryTable(sender:)), for: .touchUpInside)
        
        let barNexBt = UIBarButtonItem(customView: nextBtn)
        navigationItem.rightBarButtonItems = [barNexBt]
        // Do any additional setup after loading the view.
    }
    
    @objc func gotoHistoryTable(sender: UIButton) {
        
        let _ = navigationController?.popViewController(animated: false)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if  let afterSelected = selectDate {
            afterSelected(startDate,endDate)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectDateViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let days = DateCalculator.daysOfMonth(index: section)
        let firstWeekDay = DateCalculator.firstWeekDayOfMonth(index: section) - 1
        
        return days + (firstWeekDay)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as? DayCell {
            
            let firstWeekDay = DateCalculator.firstWeekDayOfMonth(index: indexPath.section) - 1
            //print(DateCalculator.yyyyMMddhhmmss.string(from: DateCalculator.getDayStartMoment(date: Date())))
            if indexPath.row < firstWeekDay {
                cell.dayStyle = .NODay
            }else {
                let interval: Float = 3600.0 * 24.0 *  Float(indexPath.row - firstWeekDay)
                let day = Date(timeInterval: TimeInterval(interval) , since: DateCalculator.FirstDayOfMonth(index: indexPath.section))
                cell.dayStyle = .normal
                if DateCalculator.getMonth(index: indexPath.section) == DateCalculator.getMonth(date: day) {
                    cell.dayLab.text = DateCalculator.getDay(date: day).description
                    cell.day = day
                    if day < DateCalculator.getDayStartMoment(date: Date()) {
                        cell.dayStyle = .disable
                    }else {
                        cell.dayStyle = .normal
                        
                        if startDate != nil && endDate != nil {
                            let calendarEndDate = DateCalculator.getDayStartMoment(date: endDate!)
                            if day == startDate {
                                cell.dayStyle = .startDate
                            }else if day > startDate! && day < calendarEndDate {
                                cell.dayStyle = .seletedDate
                            }else if day == calendarEndDate {
                                cell.dayStyle = .endDate
                            }
                        }else if startDate != nil && day == startDate {
                            cell.dayStyle = .startDate
                        }else if endDate != nil && day == DateCalculator.getDayStartMoment(date: endDate!) {
                            cell.dayStyle = .endDate
                        }
                        
                    }
                }else {
                    cell.dayStyle = .NODay
                }
                
            }
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/7
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.size.width
        let height: CGFloat = 76
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! MonthHeaderView
            let date = DateCalculator.FirstDayOfMonth(index: indexPath.section)

            header.dateLab.text =  DateCalculator.mmmmDf.string(from: date) + " " + DateCalculator.yyyyDf.string(from: date)
            return header
      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? DayCell {
        
            if startDate == nil {
                startDate = cell.day
            }else if endDate == nil {
                if cell.day > startDate! {
                    endDate = DateCalculator.getDayEndMoment(date: cell.day)
                }else {
                    endDate = startDate!
                    startDate = cell.day
                }
                
            }else if cell.day < startDate! {
                startDate = cell.day
            }else if cell.day > endDate! {
                endDate = DateCalculator.getDayEndMoment(date: cell.day)
            }else {
                if lastSetIsStratDate {
                    startDate =  cell.day
                }else {
                    endDate = DateCalculator.getDayEndMoment(date: cell.day)
                }
            }
            
            collectionView.reloadData()
        }
    }
    
    
}
