//
//  MenuTableViewController.swift
//  VKMusicNew
//
//  Created by Nikita Aplin on 29.01.17.
//  Copyright © 2017 TOP4EK. All rights reserved.
//

import UIKit
import DrawerController

class MenuTableViewController: UITableViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = userImage.frame.height / 2
        
        self.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
        let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! menuCell
        cell.titleLable.textColor = UIColor.backgroundColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if userImage.image != nil { return }
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        if let image = UIImage(contentsOfFile: "\(documentsPath)/user_image.png") {
            userImage.image = image
            userName.text = UserDefaults.standard.value(forKey: "user_name") as? String
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 3 ? 35 : 3
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.backGroundDarkColor()
        return view
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! menuCell
        cell.titleLable.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Global.appDelegate.drawerController.toggleLeftDrawerSide(animated: true, completion: nil)
        
        let cell = tableView.cellForRow(at: indexPath) as! menuCell
        cell.titleLable.textColor = UIColor.backgroundColor()
        
        switch (indexPath.section) {
        case 0:
            Global.currentTypeOfCenter = .MyMusicController
            break
        case 1:
            Global.currentTypeOfCenter = .SuggestedController
            break
        case 2:
            Global.currentTypeOfCenter = .PopularController
            break
        case 3:
            Global.currentTypeOfCenter = .SavedController
            break
        case 4:
            print("Developer is Nikita Aplin")
            let alert = UIAlertController(title: "🌚Никита Аплин🌝", message: "Разработчик этой неебической хуйни", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Мой ВК", style: UIAlertActionStyle.default, handler: { action in
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string : "https://vk.com/aplinxy9plin")!, options: [:], completionHandler: { (status) in
                        print("Opened")
                    })
                } else {
                    // Fallback on earlier versions
                }
                print("My VK")
            }))
            alert.addAction(UIAlertAction(title: "Сказать спасибо", style: UIAlertActionStyle.default, handler: { action in
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string : "https://qiwi.me/bc68f272-2200-43b8-9213-6f57610517d3")!, options: [:], completionHandler: { (status) in
                        print("Opened")
                    })
                } else {
                    // Fallback on earlier versions
                }
                print("My VK")
            }))
            self.present(alert, animated: true, completion: nil)
            Global.currentTypeOfCenter = .MyMusicController
            break
        default:
            print("\(indexPath.row) row selected")
        }
        
        let myMusicController = self.storyboard?.instantiateViewController(withIdentifier: Global.ControllersIdentifiers.MyMusicController.rawValue)
        Global.appDelegate.drawerController.centerViewController = myMusicController
    }
}

class menuCell: UITableViewCell {
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view = UIView()
        view.backgroundColor = UIColor.defaultBlueColor()
        self.selectedBackgroundView = view
    }
}
