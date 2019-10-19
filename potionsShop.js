var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 8888,
  user: "root",
  password: "",
  database: "potShop_DB"
});

connection.connect(function(err) {
  if (err) throw err;
  start();
});

function start() {
  connection.query("SELECT * FROM potions", function(err, results) {
    if (err) throw err;
    inquirer
      .prompt([
        {
          name: "choice",
          type: "rawlist",
          choices: function() {
            var choiceArray = [];
            for (var i = 0; i < results.length; i++) {
              choiceArray.Array.push(results[i].item_name);
            }
            return choiceArray;
          },
          message: "Which potion would you like to buy?"
        },
        {
          name: "quantity",
          type: "input",
          message: "How many would you like to buy?"
        }
      ])
      .then(function(answer) {
        var chosenItem;
        for (var i = 0; i < results.length; i++) {
          if (results[i].item_name === answer.choice) {
            chosenItem = results[i];
          }
        }
        if (chosenItem.stock_quantity <= parseInt(answer.quantity)) {
          connection.query(
            [{ stock_quantity: chosenItem.stock_quantity - answer.quantity }],
            function(error) {
              if (error) throw err;
              console.log("An error occured. Try again.");
              start();
            }
          );
        } else {
          console.log("Not enough stock. Please try again.");
        }
      });
  });
}
