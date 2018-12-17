use Mix.Config

config :explorer,
  json_rpc_named_arguments: [
    transport: EthereumJSONRPC.HTTP,
    transport_options: [
      http: EthereumJSONRPC.HTTP.HTTPoison,
      url: "http://18.207.247.30:8545",
      method_to_url: [
        eth_call: "http://18.207.247.30:8545",
        eth_getBalance: "http://18.207.247.30:8545",
        trace_replayTransaction: "http://18.207.247.30:8545"
      ],
      http_options: [recv_timeout: 60_000, timeout: 60_000, hackney: [pool: :ethereum_jsonrpc]]
    ],
    variant: EthereumJSONRPC.Parity
  ],
  subscribe_named_arguments: [
    transport: EthereumJSONRPC.WebSocket,
    transport_options: [
      web_socket: EthereumJSONRPC.WebSocket.WebSocketClient,
      url: "ws://18.207.247.30:8546"
    ],
    variant: EthereumJSONRPC.Parity
  ]
