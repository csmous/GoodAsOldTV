//
//  ProductTableViewControllerswift
//  GoodAsOldPhones
//
//  Created by csmous on 25/11/2018.
//  Copyright © 2018 csmous. All rights reserved.
//

import UIKit

class ProductTableViewController: UIViewController ,  UITableViewDataSource, UITableViewDelegate {

    enum tvGeneration {
        case BlacknWhite
        case Multichromatic
        case ThreeD
        case Smart
        case Incurved
        case Upcoming
    }
    @IBOutlet weak var tableView: UITableView!
    private lazy var savedProducts : [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cellReuseIdentifier")
        
        self.savedProducts = fetchProducts()
        
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell : ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! as! ProductTableViewCell
        
        let Element = savedProducts[indexPath.row] //2.
        
        
        cell.Label?.text = Element.descrip //3.
        cell.Photo?.image = UIImage(named:Element.cellImage ?? "Empty_TV")

        if (indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.gray
        }
        else{
          cell.backgroundColor = UIColor.darkGray
        }
        return cell //4.
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "fullDescriptionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fullDescriptionSegue" {
            
            let destinationVC = segue.destination as! DetailProdViewController
            let sourceVC = segue.source as! ProductTableViewController
            destinationVC.item = sourceVC.savedProducts[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    

//MARK: - private methods
    private func fetchProducts() -> [Product] {
        
        var allProducts : [Product] = []
        
        let createAndAdd = { (date: Int, modelName: String, cellImage: String?, fullscreenImage: String?, fullModelDescription : String)  in
            let element = Product(date: date, modelName: modelName, cellImage: cellImage, fullscreenImage: fullscreenImage, fullModelDescription : fullModelDescription )
            allProducts.append(element)
            }
        
        createAndAdd(1920, "Black and white ", "blackNwhite_TV", "black_white", getTextualDescription(type :.BlacknWhite))
        createAndAdd(1940, "Multi chromatic  ", "colored_TV", "colored", getTextualDescription(type :.Multichromatic))
        createAndAdd(1990, "Three dimentional ", "threeD_TV", "TV-3D", getTextualDescription(type :.ThreeD))
        createAndAdd(2009, "Smart TV", "smart_TV", "smart_tv", getTextualDescription(type :.Smart))
        createAndAdd(2010, "Incurved tv  ", "curved_TV", "curved_tv", getTextualDescription(type :.Incurved))
        createAndAdd(2030, "Future TV ... ",nil,"tv_wall", getTextualDescription(type :.Upcoming))
        
        return (allProducts)
    }

    func getTextualDescription(type : tvGeneration) -> String {
        let text : String
        switch type {
        case .BlacknWhite:
            text = """
    By the 1920s, when amplification made television practical, Scottish inventor John Logie Baird employed the Nipkow disk in his prototype video systems.
On 25 March 1925, Baird gave the first public demonstration of televised silhouette images in motion, at Selfridge's Department Store in London.[19] Since human faces had inadequate contrast to show up on his primitive system, he televised a ventriloquist's dummy named "Stooky Bill", whose painted face had higher contrast, talking and moving. By 26 January 1926, he demonstrated the transmission of the image of a face in motion by radio. This is widely regarded as the first television demonstration. The subject was Baird's business partner Oliver Hutchinson. Baird's system used the Nipkow disk for both scanning the image and displaying it. A bright light shining through a spinning Nipkow disk set with lenses projected a bright spot of light which swept across the subject. A Selenium photoelectric tube detected the light reflected from the subject and converted it into a proportional electrical signal. This was transmitted by AM radio waves to a receiver unit, where the video signal was applied to a neon light behind a second Nipkow disk rotating synchronized with the first. The brightness of the neon lamp was varied in proportion to the brightness of each spot on the image. As each hole in the disk passed by, one scan line of the image was reproduced. Baird's disk had 30 holes, producing an image with only 30 scan lines, just enough to recognize a human face.In 1927, Baird transmitted a signal over 438 miles (705 km) of telephone line between London and Glasgow.
"""

        case .Multichromatic:
            text = """
    As early as 1940, Baird had started work on a fully electronic system he called Telechrome.
Early Telechrome devices used two electron guns aimed at either side of a phosphor plate. The phosphor was patterned so the electrons from the guns only fell on one side of the patterning or the other. Using cyan and magenta phosphors, a reasonable limited-color image could be obtained. He also demonstrated the same system using monochrome signals to produce a 3D image (called "stereoscopic" at the time). A demonstration on 16 August 1944 was the first example of a practical color television system. Work on the Telechrome continued and plans were made to introduce a three-gun version for full color. However, Baird's untimely death in 1946 ended development of the Telechrome system.[121][122] Similar concepts were common through the 1940s and 1950s, differing primarily in the way they re-combined the colors generated by the three guns. The Geer tube was similar to Baird's concept, but used small pyramids with the phosphors deposited on their outside faces, instead of Baird's 3D patterning on a flat surface. The Penetron used three layers of phosphor on top of each other and increased the power of the beam to reach the upper layers when drawing those colors. The Chromatron used a set of focusing wires to select the colored phosphors arranged in vertical stripes on the tube.
"""
        case .ThreeD:
            text = """
                3D television conveys depth perception to the viewer by employing techniques such as stereoscopic display, multi-view display, 2D-plus-depth, or any other form of 3D display.
            Most modern 3D television sets use an active shutter 3D system or a polarized 3D system, and some are autostereoscopic without the need of glasses. Stereoscopic 3D television was demonstrated for the first time on 10 August 1928, by John Logie Baird in his company's premises at 133 Long Acre, London.[136] Baird pioneered a variety of 3D television systems using electromechanical and cathode-ray tube techniques. The first 3D TV was produced in 1935. The advent of digital television in the 2000s greatly improved 3D TVs. Although 3D TV sets are quite popular for watching 3D home media such as on Blu-ray discs, 3D programming has largely failed to make inroads with the public. Many 3D television channels which started in the early 2010s were shut down by the mid-2010s.According to DisplaySearch 3D televisions shipments totaled 41.45 million units in 2012, compared with 24.14 in 2011 and 2.26 in 2010.[137] As of late 2013, the number of 3D TV viewers started to decline.
            """
        case .Smart:
            text = """
                A smart television, sometimes referred to as connected TV or hybrid TV, is a television set or set-top box with integrated Internet and Web 2.0 features, and is an example of technological convergence between computers, television sets and set-top boxes.
            Besides the traditional functions of television sets and set-top boxes provided through traditional broadcasting media, these devices can also provide Internet TV, online interactive media, over-the-top content, as well as on-demand streaming media, and home networking access. These TVs come pre-loaded with an operating system.[131][132][133][9]
            
            Smart TV should not to be confused with Internet TV, Internet Protocol television (IPTV) or with Web TV. Internet television refers to the receiving of television content over the Internet instead of by traditional systems – terrestrial, cable and satellite (although internet itself is received by these methods). IPTV is one of the emerging Internet television technology standards for use by television broadcasters. Web television (WebTV) is a term used for programs created by a wide variety of companies and individuals for broadcast on Internet TV. A first patent was filed in 1994[134] (and extended the following year)[135] for an "intelligent" television system, linked with data processing systems, by means of a digital or analog network. Apart from being linked to data networks, one key point is its ability to automatically download necessary software routines, according to a user's demand, and process their needs. Major TV manufacturers have announced production of smart TVs only, for middle-end and high-end TVs in 2015.[6][7][8] Smart TVs are expected to become dominant form of television by late 2010s.
            """
        case .Incurved:
            text = """
                Curved screen TVs were introduced to the consumer market in April 2014, primarily due to the efforts of Korean companies Samsung and LG, while curved screen projection displays have been around since the 1950s
                Curved screens are marketed as providing an "immersive" experience, and allowing a wider field of view.[citation needed]
            
                Similar to a movie theater having good and bad seats, there is an optimal position when it comes to watching TV at home. This optimal position is directly along the central axis of the TV with the central point of the screen at eye level. Viewers seated in any other position come to experience degradations in picture quality ranging anywhere from minor to severe, the most notable being trapezoidal distortion.[1]
            
                Manufacturers suggest that curved screens allow greater range in satisfactory viewing angles and offer minimal trapezoidal distortion compared to flat-screens. The claim that curved screens provide a wider field view is disputed, by another claim that a substantial offset from the center provides greater viewing distortion than that of a flat screen.[2] However, the equidistant claim by manufacturers of the various parts of the screen from a centered view is supported.[2] A [16:9] 65-inch (1,700 mm) curved screen TV versus a 65" flat television viewed from 4.2 metres (420 cm; 170 in) from the centre of the TV offers 0.19 degree (~1%) greater viewing angle (based on Samsung's 4200R curved TV).[citation needed]
            
                Curved TVs supposedly offer minimized glare from ambient light
            """
        case .Upcoming:
            text = """
            
            More information to come ...
            """
            
            
        }
        return text
    }
}

