import UIKit

class MovieList {
    private var tracks = ["The Godfather", "The Dark Knight", "Home alone."]
    subscript(index: Int) -> String {
        get {
            return self.tracks[index]
        }
        set {
            self.tracks[index] = newValue
        }
    }
}

var movieList = MovieList()
var aMovie = movieList[0]
print("aMovie: \(aMovie)\n")

movieList[2] = "Forest Gump"
aMovie = movieList[2]
print("aMovie: \(aMovie)\n")
