import Foundation

var postalCode: NSString = NSString(format: "%d-%d", 32259,1234)
var len = postalCode.length
print("postal code length: \(len)\n")

@objc(ObjCMovieList)
class MovieList: NSObject {
    private var tracks = ["The Godfather", "Homealone", "The Dark Knight"]
    
    subscript(index: Int) -> String {
        get {
            return self.tracks[index]
        }
        set {
            self.tracks[index] = newValue
        }
    }
}
