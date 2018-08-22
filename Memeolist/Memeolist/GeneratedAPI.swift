//  This file was automatically generated and should not be edited.

import Apollo

public final class AllMemesQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllMemes {\n  allMemes {\n    __typename\n    id\n    photourl\n    owner\n    likes\n    comments {\n      __typename\n      id\n      comment\n      owner\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allMemes", type: .nonNull(.list(.nonNull(.object(AllMeme.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allMemes: [AllMeme]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allMemes": allMemes.map { (value: AllMeme) -> ResultMap in value.resultMap }])
    }

    public var allMemes: [AllMeme] {
      get {
        return (resultMap["allMemes"] as! [ResultMap]).map { (value: ResultMap) -> AllMeme in AllMeme(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllMeme) -> ResultMap in value.resultMap }, forKey: "allMemes")
      }
    }

    public struct AllMeme: GraphQLSelectionSet {
      public static let possibleTypes = ["Meme"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("photourl", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
        GraphQLField("comments", type: .nonNull(.list(.nonNull(.object(Comment.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, photourl: String, owner: String? = nil, likes: Int, comments: [Comment]) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photourl": photourl, "owner": owner, "likes": likes, "comments": comments.map { (value: Comment) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var photourl: String {
        get {
          return resultMap["photourl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photourl")
        }
      }

      public var owner: String? {
        get {
          return resultMap["owner"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "owner")
        }
      }

      public var likes: Int {
        get {
          return resultMap["likes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var comments: [Comment] {
        get {
          return (resultMap["comments"] as! [ResultMap]).map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Comment) -> ResultMap in value.resultMap }, forKey: "comments")
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["Comment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("comment", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, comment: String, owner: String) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "comment": comment, "owner": owner])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var comment: String {
          get {
            return resultMap["comment"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "comment")
          }
        }

        public var owner: String {
          get {
            return resultMap["owner"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class MemeAddedSubscription: GraphQLSubscription {
  public let operationDefinition =
    "subscription memeAdded {\n  memeAdded {\n    __typename\n    id\n    photourl\n    likes\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("memeAdded", type: .nonNull(.object(MemeAdded.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(memeAdded: MemeAdded) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "memeAdded": memeAdded.resultMap])
    }

    public var memeAdded: MemeAdded {
      get {
        return MemeAdded(unsafeResultMap: resultMap["memeAdded"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "memeAdded")
      }
    }

    public struct MemeAdded: GraphQLSelectionSet {
      public static let possibleTypes = ["Meme"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("photourl", type: .nonNull(.scalar(String.self))),
        GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, photourl: String, likes: Int) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photourl": photourl, "likes": likes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var photourl: String {
        get {
          return resultMap["photourl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photourl")
        }
      }

      public var likes: Int {
        get {
          return resultMap["likes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }
    }
  }
}

public final class CreateMemeMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateMeme($ownerid: ID!, $photourl: String!, $owner: String!) {\n  createMeme(ownerid: $ownerid, photourl: $photourl, owner: $owner) {\n    __typename\n    id\n    photourl\n    owner\n    likes\n  }\n}"

  public var ownerid: GraphQLID
  public var photourl: String
  public var owner: String

  public init(ownerid: GraphQLID, photourl: String, owner: String) {
    self.ownerid = ownerid
    self.photourl = photourl
    self.owner = owner
  }

  public var variables: GraphQLMap? {
    return ["ownerid": ownerid, "photourl": photourl, "owner": owner]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMeme", arguments: ["ownerid": GraphQLVariable("ownerid"), "photourl": GraphQLVariable("photourl"), "owner": GraphQLVariable("owner")], type: .nonNull(.object(CreateMeme.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createMeme: CreateMeme) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createMeme": createMeme.resultMap])
    }

    public var createMeme: CreateMeme {
      get {
        return CreateMeme(unsafeResultMap: resultMap["createMeme"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createMeme")
      }
    }

    public struct CreateMeme: GraphQLSelectionSet {
      public static let possibleTypes = ["Meme"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("photourl", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, photourl: String, owner: String? = nil, likes: Int) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photourl": photourl, "owner": owner, "likes": likes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var photourl: String {
        get {
          return resultMap["photourl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photourl")
        }
      }

      public var owner: String? {
        get {
          return resultMap["owner"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "owner")
        }
      }

      public var likes: Int {
        get {
          return resultMap["likes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }
    }
  }
}