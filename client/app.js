
App = {
    init: () => {
        console.log("Loaded")
        App.loadEthereum()
        App.loadAccount()
        App.loadContracts()
    },
//Aca verifico si tienen una billetera instalada para poder firmar la transaccion
    loadEthereum: async () => {
        if (window.ethereum) {
            App.web3Provider = window.ethereum;
            await window.ethereum.request({ method: 'eth_requestAccounts' })
 }  else if (window.web3) { //si existe web3.js lo utilizaria tambien
     web3 = new web3(window.currentProvider)
 }
    else {
            console.log("The browser does not have ethereum, try installing MetaMask")
                    }
                 },

    loadAccount: async () => {
       const accounts =  await window.ethereum.request({ method: 'eth_requestAccounts' })
                    App.account = accounts[0]
                  },

    loadContracts: async () => {
       // LLamo al formato JSON del TasksContract
        const res = await fetch("TasksContract.json")
        const tasksContractJSON = await res.json()
    },
    
    createTask: async (title, description) => {
          const result = await App.tasksContract.createTask(title, description, {from: App.account})
          console.log(result.logs[0].args)     
        } 
    }
    App.init()

