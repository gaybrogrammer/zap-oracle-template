async function getResponse(query,params){
	//Get data based on the query string and Parameters
	var Coinmarketcap = require("node-coinmarketcap");
	var coinmarketcap = new Coinmarketcap;
	var MyCoin = params[0];

	coinmarketcap.multi( coins => {
        var Array1 = coins.getTop(100);
        
        let found_coin = false;
        for(let i = 0;i < Array1.length; i +=1){
            
            if(Array1[i]["name"] === MyCoin){
                found_coin = true;
            }
        }
		if (found_coin == true) {
		
			console.log("it is not a shitcoin")
			} else {
			console.log("it is a shitcoin ");
        }
	});
}  

 async function BuyToken(TokenName, ZapAmount) { //put in amount of tokens you want to buy
    var Zapamount = parseFloat(ZapAmount);
    var CoinMarketCap = require("node-coinmarketcap"); //instantiate coinmarketcap oracle (do not declare globally)
    var coinmarketcap = new CoinMarketCap; //instantiate coinmarketcap oracle 
    let ZapPrice;
    coinmarketcap.get("Zap", coin => {
        ZapPrice = parseFloat(coin.price_usd)
        console.log("zapprice running");
        coinmarketcap.get(TokenName, coin2 => {
            //set token price to the price on coinmarketcap
         let TokenPrice = parseFloat(coin2.price_usd)
         console.log("tokenprice running");
         console.log("end statemenst of function running");
     console.log(Zapamount);
     console.log(ZapPrice);
     console.log(TokenPrice);
     var TokensAwarded = (Zapamount)*parseFloat(ZapPrice) / parseFloat(TokenPrice);
 console.log("You have bought: " + TokensAwarded + " " + TokenName + " tokens at a price of: " + ZapPrice + " Zap");
 
       });

    });
      
       
    
    
}

function SellToken(TokenName, TokenAmount) { //put in the amount of tokens you want to sell
    var CoinMarketCap = require("node-coinmarketcap");  //instantiate coinmarketcap oracle (do not declare globally
    var coinmarketcap = new CoinMarketCap; //instantiate coinmarketcap oracle
    var ZapPrice;
    var TokenPrice;
    coinmarketcap.get("Zap", coin =>{
        ZapPrice = coin.price_usd; //set zap price to the price on coinmarketcap
    });
     coinmarketcap.get(TokenName, coin =>{
        TokenPrice = coin.price_usd; //set token price to the price on coinmarketcap
        var ZapAwarded = (amount*TokenPrice) / ZapPrice; // set the zap you get back equal to the token amount x the usd price divided by zap price
    console.log("You have sold: " + TokenAmount  + TokenName + "tokens at a price of:" + TokenPrice + " Zap and received:" + ZapAwarded + " Zap");
    });
     
}
module.exports = {
	getResponse:getResponse
}
console.log("the program is running");
BuyToken("Bitcoin", 65000);

getResponse("a string",["Lisk","stringy","stringify"]);