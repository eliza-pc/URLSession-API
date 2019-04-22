//
//  ViewController.swift
//  URLSession
//
//  Created by Eliza Maria Porto de Carvalho on 19/11/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    
    func get_image(_ url_str:String, _imageView:UIImageView){
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if data != nil {
                
                let image = UIImage(data: data!)
                if(image != nil){
                    
                    DispatchQueue.main.async(execute: { _imageView.image = image})
                }
            }
            
        })
        
        task.resume()
    }
    
    //test
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let mistica = "https://s.gravatar.com/avatar/10dceaef9932c7027fb2157cad710367?s=150"
        
       get_image(mistica, _imageView: image)
        
    }
    

}

