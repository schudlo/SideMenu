//
//  ViewController.swift
//  SideMenu
//
//  Created by Andrii Shchudlo on 08/08/2019.
//  Copyright © 2019 Andrii Shchudlo. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var cellColors = ["F28044","F0A761","FEC362","F0BB4C","E3CB92","FEA375"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    
    }

    func sideAnimationStatic() {
        let rotationTRansform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        view.layer.transform = rotationTRansform
        view.alpha = 0.5
        
        UIView.animate(withDuration: 0.5) {
            self.view.layer.transform = CATransform3DIdentity
            self.view.alpha = 0.5
        }
    }
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        cell.contentView.backgroundColor = .random()
        cell.label.text = "Row: \(indexPath.row)"        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: -tableView.bounds.width, y: 0)
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
