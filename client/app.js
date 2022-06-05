
App = {
    init: () => {
        console.log("loaded")
        App.loadEthereum()
    },
//Aca verifico si tienen una billetera instalada para poder firmar la transaccion
    loadEthereum: () => {
        if (window.ethereum) {
            console.log("Ethereum verification succefuly")
        } else {
            console.log("The browser does not have ethereum, try installing MetaMask")
        }
    }

}