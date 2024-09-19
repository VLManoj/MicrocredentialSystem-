module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // localhost
      port: 7545, // default Ganache port
      network_id: 5777 // Custom network ID for Ganache
    }
  },
  compilers: {
    solc: {
      version: "0.8.0"
    }
  }
};
