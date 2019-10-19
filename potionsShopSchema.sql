DROP DATABASE IF EXISTS potShop_DB;
CREATE DATABASE potShop_DB;

USE potShop_DB;

CREATE TABLE potions
(
    id INT NOT NULL
    AUTO_INCREMENT,
    item_name VARCHAR
    (100) NOT NULL,
    item_type VARCHAR
    (15) NOT NULL,
    price INT default 0,
    stock_quantity INT default 0,
    item_description VARCHAR
    (100) NOT NULL,
    PRIMARY KEY
    (id)
);

    INSERT INTO potions
        (item_name, item_type, price, stock_quantity, item_description)
    VALUES
        ("Alihotsy Draught", MISC, 20, 100, "Induces uncontrollable laughing.");

    INSERT INTO potions
        (item_name, item_type, price, stock_quantity, item_description)
    VALUES
        ("Draught of Living Death", MP, "Drinker will show no signs of life. Drains all MP.")

    INSERT INTO potions
        (item_name, item_type, price, stock_quantity, item_description)
    VALUES
        ("Elixir of Life", HP, 100, 1, "Grants infinite HP and gold.")

    INSERT INTO potions
        (item_name, item_type, price, stock_quantity, item_description)
    VALUES
        ("Felix Felicis", LUCK, 50, 10, "
    Boosts LUCK by 200.")

    INSERT INTO potions
        (item_name, item_type, price, stock_quantity, item_description)
    VALUES
        ("Pepperup Potion", STATUS, 20, 100, "Clears all status effects and restores 10 HP.")