struct Post {
    // Property
    let avatar: String
    let nickname: String
    let text: String
    let image: String
}

func createPost() -> Post {
    guard var randomAvatar = photos.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
    guard let randomNickname = authors.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
    guard let randomText = posts.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
    guard var randomImage = photos.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
    
    while randomAvatar == "" {
        guard let anotherAvatar = photos.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
        randomAvatar = anotherAvatar
    }
    
    while randomText == "", randomImage == "" {
        guard let anotherRandomImage = photos.randomElement() else { return Post(avatar: "", nickname: "", text: "", image: "") }
        randomImage = anotherRandomImage
    }
    
    return Post(avatar: randomAvatar, nickname: randomNickname, text: randomText, image: randomImage)
}
