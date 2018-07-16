import Apollo
import Foundation

public class SyncService {

    public static let instance = SyncService()
    public let serverUrl = "http://10.201.82.53:8000/graphql"
    public let wsUrl = "wss://subscriptions.us-west-2.graph.cool/v1/cjiyvc1wa40kg011846ev0ff8"
    // TODO: Initialize client from config
    let client: ApolloClient

    init() {
        let configuration = URLSessionConfiguration.default
        let url = URL(string: self.serverUrl)!
        client = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        client.cacheKeyForObject = { $0["id"] }
    }
}
