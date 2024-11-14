-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 05:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cck_websystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `pass` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `name`, `pass`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
(1, 'CCK Products'),
(2, 'Vegetables & Fruits'),
(3, 'Organic'),
(4, 'Dairy & Chilled Juice'),
(5, 'Eggs Tofu & Deli'),
(6, 'Meat & Seafood'),
(7, 'Frozen Food'),
(8, 'Breakfast'),
(9, 'Home Baking'),
(10, 'Food Cupboard'),
(11, 'Beverages & Drinks'),
(12, 'Snacks & Confectionery'),
(13, 'Household'),
(14, 'Kitchen Dining & Home'),
(15, 'Baby & Child'),
(16, 'Toiletries Health & Beauty'),
(17, 'Non-Halal'),
(18, 'Beer Wine & Spirits'),
(19, 'Pet Care');

-- --------------------------------------------------------

--
-- Table structure for table `claim`
--

CREATE TABLE `claim` (
  `claimID` int(11) NOT NULL,
  `memberID` varchar(32) NOT NULL,
  `gameID` int(11) NOT NULL,
  `claim_date` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_wheel`
--

CREATE TABLE `daily_wheel` (
  `rewardID` int(11) NOT NULL,
  `reward_value` varchar(50) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_wheel`
--

INSERT INTO `daily_wheel` (`rewardID`, `reward_value`, `color`) VALUES
(1, 'RM15', '#db7093'),
(2, 'RM5', '#20b2aa'),
(3, 'Nothing', '#d63e92'),
(4, 'RM5', '#daa520'),
(5, 'RM10', '#ff340f'),
(6, 'RM5', '#ff7f50'),
(7, 'Nothing', '#3cb371'),
(8, 'RM15', '#4169e1');

-- --------------------------------------------------------

--
-- Table structure for table `exist_member`
--

CREATE TABLE `exist_member` (
  `existsmemID` int(11) NOT NULL,
  `memberID` varchar(10) NOT NULL,
  `phoneNum` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exist_member`
--

INSERT INTO `exist_member` (`existsmemID`, `memberID`, `phoneNum`) VALUES
(1, '5600519981', '0109695599'),
(2, '1111111111', '1111111111');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `gameID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `reward_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `name`, `price`, `description`, `category`, `image`) VALUES
(1, 'CCK SWEET CORN 500G', '5', 'One of the main nutritional benefits of sweetcorn is its high fibre content. And as we know, dietary fibre is important for our health: it aids digestion, it can decrease the risk of heart disease, strokes.\r\nOn top of that, fibre helps you stay fuller for longer just like consuming potatoes.\r\n', 1, 'images/corn_product.jpeg'),
(2, 'CCK CHICKEN NUGGETS 450G', '10', 'food product consisting of a small piece of deboned chicken meat that is breaded or battered\r\nSuggest cooking method : Deep fried or air-fryer\r\nWeight: 900g', 1, 'images/chickennuggets.jpeg'),
(3, 'CCK MINCED BEEF 400G', '13', 'Minced beef or beef mince is beef that has been finely chopped with a knife or a meatgrinder or mincing machine.\r\nIt is used in many recipes including hamburgers,spaghetti Bolognese and also used many other Asian cookings.', 1, 'images/mincedbeef.jpeg'),
(4, 'CCK FISH BALL (S) 500G', '9', 'Fish balls are balls made from fish paste which are then boiled or deep-fried.', 1, 'images/fishball.jpeg'),
(5, 'CCK SATAY BEEF 300G', '26', 'Marinated overnight with spices, skewed to satay and grilled.\r\nBest eaten with local peanut sauce taste juicy and nutty.', 1, 'images/sataybeef.jpeg'),
(6, 'CCK MIX VEGETABLES 900G', '8', 'Variety of vegetables mixed in one pack\r\nSuitable for cooking fried rice, soups, dumplings , etc.\r\nConvenient to cook', 1, 'images/mixvege.jpeg'),
(7, 'CCK CHICKEN BURGER 900G', '14', 'Preparation method\r\n\r\n1. Defrosting is not required before cooking.\r\n\r\n2. Heat the pan to a temperature of 175 ° C-180 ° C.\r\n\r\n3. Cook each surface for 3 to 4 minutes.', 1, 'images/chickenburger.jpeg'),
(8, 'UNIIFOOD CHICKEN DIM SUM 400G', '17', 'Uniifood Chicken Dim Sum is suitable for steam.', 1, 'images/dimsum.jpeg'),
(9, 'CCK ORIGINAL CHICKEN FRANK 300G', '5', 'Suitable to be eaten as a side dish or as accompaniment in fried rice. \r\nCan be cooked in many ways : Fried, BBQ, Steamboat/Hotpot or cooked in Soup\r\nHalal', 1, 'images/orichickenfrank.jpeg'),
(10, 'CCK BREADED POLLOCK FINGER 400G', '16', '16pcs/box\r\n24 Months Shelf Life\r\nHalal Certified\r\n✅Weight: 400G\r\n\r\n\r\nDeep sea pollock fish, coated in a crunchy breading\r\nRich in omega-3 fatty acids, Protein\r\nCook from frozen, easy to cook\r\n\r\n\r\nServing Suggestion:\r\n\r\nAppetizers\r\nFish & Chips\r\nChildren\'s Menu\r\nFried Platter\r\nFish Taco\r\nSandwich Wraps\r\n\r\n\r\nCooking instructions:\r\n\r\nDeep Fry \r\n175-180°C\r\n2-3 minutes\r\nAir Fryer\r\n\r\n200-220°C\r\n5-8 minutes\r\nOven Heat\r\n\r\n200-220°C\r\n5-8 minutes', 1, 'images/pollockfinger.jpeg'),
(11, 'CCK BREADED POLLOCK FILLET 450G', '16', '6pcs/box\r\n24 Months Shelf Life\r\nHalal Certified\r\n✅Weight: 450G\r\n\r\n\r\nDeep sea pollock fish, coated in a crunchy breading\r\nRich in omega-3 fatty acids, Protein\r\nCook from frozen, easy to cook\r\n\r\n\r\nServing Suggestion:\r\n\r\nServes with Fries, Potato, Pickle, Lemon\r\nSandwich/Taco\r\nBun\r\n\r\n\r\nCooking instructions:\r\n\r\nDeep Fry\r\n\r\n175-180 °C\r\n3-4 minutes\r\nAir Fryer\r\n\r\n200 °C\r\n7-8 minutes', 1, 'images/pollockfillet.jpeg'),
(12, 'CCK PREMIO BEEF BALL 500G', '13.7', '', 1, 'images/premiobeefball.jpeg'),
(13, 'CCK CRAB MEAT STICK 200G', '3.1', 'Suitable for steamboat, hotpot, BBQ & soups.\r\nStorage: Keep frozen at -18°C. Do not refreeze.', 1, 'images/crabstick.jpeg'),
(14, 'CCK SEAFOOD MASTER SALAD SALMON 60G', '7.9', 'Flavours included:\r\nSmoked\r\nSweet BBQ\r\nRattan Pepper', 1, 'images/saladsalmon60.jpeg'),
(15, 'CCK SATAY CHICKEN 300G', '15.2', 'Marinated overnight with spices, skewed to satay and grilled.\r\nBest eaten with local peanut sauce taste juicy and nutty.', 1, 'images/sataychicken.jpeg'),
(16, 'CCK GOLDEN FISH CAKE 450G', '9.8', 'It is somewhat like a sausage made of fish meat.\r\nIt is a simple, tasty and affordable version of a dish for fish\r\nTaste savory with soft texture and can have various flavors depending on the additional ingredient', 1, 'images/fishcake450g.jpeg'),
(17, 'CCK CHICKEN BALL 400G', '9.7', '✅Weight: 400g, Defrost is not needed.\r\nBoil fish balls in boiling water for 4-5 minutes or fry the fish balls in hot oil at 170°C-180°C for 3-4 minutes.', 1, 'images/chickenball.jpeg'),
(18, 'CCK FISH FILLET 700G', 'RM12.10', 'There are several advantages to filleting fish for cooking. It reduces the cooking time and makes it easier to portion and eat. It is particularly useful for bigger fish, especially meatier varieties that don\'t easily fall apart. Filleting also allows you to eat the fish over several meals.', 1, 'images/fishfillet700g.jpeg'),
(19, 'CCK CHICKEN NUGGETS 900G', 'RM16.10', 'Food product consisting of a small piece of deboned chicken meat that is breaded or battered\r\nSuggest cooking method : Deep fried or air-fryer\r\n✅Weight: 900g', 1, 'images/chicnugget900g.jpeg'),
(20, 'CCK SQUID TUBE 500G', 'RM16.90', '24 Months Shelf Life and Halal Certified. Todaroes Pacificus, STTP Treated.\r\n✅Weight: 500G', 1, 'images/squidtube500g.jpeg'),
(21, 'CCK WHITE FISH CAKE 500G', 'RM8.50', 'Fish Meat, Potato Starch, Salt, Sugar, Monosodium Glutamate and Garlic.\r\n✅Weight:500g', 1, 'images/whitefishcake.jpeg'),
(22, 'CCK BREADED SALMON FINGER 400G', 'RM14.90', '16pcs/box, 24 Months Shelf Life, Halal Certified and ✅Weight: 400G.\r\nWild Salmon, Coated in a crunchy breading\r\nRich in omega-3 fatty acids, Protein\r\nCook from frozen, easy to cook', 1, 'images/salmonfinger400g.jpeg'),
(23, 'CCK HONEY CHICKEN FRANK 300G', 'RM5.10', 'Suitable to be eaten as a side dish or as accompaniment in fried rice. \r\nCan be cooked in many ways : Fried, BBQ, Steamboat/Hotpot or cooked in Soup\r\n✅Halal\r\n✅Weight: 300g\r\nIngredients\r\n\r\nChicken meat, water, starch, soy protein, sugar, hydrolysed vegetable protein, spices & salt. Contains MSG as permitted flavor enhancer, food conditioner, preservative, color and honey. (contain soya source).', 1, 'images/honeychickenfrank.jpeg'),
(24, 'CCK MINCED CHICKEN 400G', 'RM11.40', 'Chicken Mince (ground chicken) is the white meat, leaner alternative to beef mince.\r\nBasically, anything you make with beef mince you can make with chicken mince, Rissoles, burgers, meatballs, meatloaf.\r\n✅Weight: 400g', 1, 'images/mincedchicken.jpg'),
(25, 'SNOW PEA (U)', 'RM 4.60 ~ RM 6.10', 'In terms of their nutrient content, snow peas are packed with vitamin A, vitamin C, iron, potassium, dietary fiber, magnesium, folic acid, and small levels of healthy fats. These pods are also very low in calories & also lack cholesterol, making them a filling, yet nutritious dietary component. There are many impressive health benefits of snow peas, including weight loss, improved heart health, reduced constipation, stronger bones, optimized immunity and lower levels of inflammation, among others. It\'s best for fried, boiled, baked or roasted.', 2, 'images/snowpea.jpg'),
(26, 'GOLDEN NEEDLE MUSHROOM 100G', 'RM 2.00 ~ RM 2.30', '-Needle mushroom in other words, enokitake (榎茸、エノキタケ), enokidake (榎茸、エノキダケ) and enoki (榎、エノキ) are derived from the Japanese language.\r\n\r\n-What does an enoki mushroom taste like? This mushroom has a delicate, savoury flavour and a crunch from the thin strands.\r\n\r\n-You can eat it sauteed or raw in salads, or throw it raw into ramen and hot pot and it cooks up right in the broth\r\n\r\n-Well Packed', 2, 'images/goldneedlemushroom.jpg'),
(27, 'POH LIAN ONION 100G', 'RM 3.50', '', 2, 'images/pohlianonion.jpg'),
(28, 'POH LIAN DAUN SUP 80G (U)', 'RM 2.80', '', 2, 'images/pohliandaun.jpg'),
(29, 'INDIA BOMBAY ONION 40-60MM (KG)', 'RM 2.90 ~ RM 9.10', '', 2, 'images/bombayonion.jpg'),
(30, 'CHINA NAVEL ORANGE (KG)', 'RM 10.90 ~ RM 16.00', 'China Navel Oranges are large, spherical oranges with thick, deep-orange, loose rinds that are easy to peel.', 2, 'images/chinanavelorange.jpg'),
(31, 'NZ DIVA APPLE 120\'S -135\'S (U)', 'RM 1.70 ~ RM 3.30', 'NZ Diva Apple is rich in vitamin C and high fibre to support a healthy system.', 2, 'images/divaapple.jpg'),
(32, 'GENTING TOMATO CHERRY ASSORTED 275G', 'RM 13.20 ~ RM 18.40', 'Genting Tomato Cherry is pearly round or plum-shaped, sweet or tangy, red or gold, these petite treats are bursting with flavour and a succulent taste.', 2, 'images/gentingtomatocherry.jpg'),
(33, 'NZ ENVY APPLE 120\'S-138\'S (U)', 'RM 2.10 ~ RM 3.30', 'Envy apples are a round variety with striated, ruby red skin with green undertones. They have a crisp, sweet white flesh that will stay pure white for up to 10 hours before succumbing to oxidation and turning brown.', 2, 'images/envyapple.jpg'),
(34, 'SA NAVEL ORANGE 72\'S - 88\'S (PCS)', 'RM 2.40 ~ RM 3.50', 'Navel Orange has a round shape and dimpled, bright orange skin. They are very high in fiber which helps improve cholesterol ratios in the body. Fiber helps regulate sugar levels in the blood, aids in preventing colon cancer.', 2, 'images/navelorange.jpg'),
(35, 'CHINA GREEN RADISH 500G', 'RM 2.90 ~ RM 5.50', 'China Green Radish also known as the Qingluobo radish are best known for their colour, which is bright green both inside and out. The skin is deep bright green toward the stalk, often fading to white near the roots. The flesh is also bright green though it\'s a lighter, fresher shade. The combined shades of green make for a really attractive cross section when sliced for salads or pickles.', 2, 'images/greenradish.jpg'),
(36, 'CHINA SHINE MUSCAT GRAPE 500G', 'RM 21.70 ~ RM 28.70', 'China Shine Muscat Grape are bright yellow-green grapes that are sweet with a hint of mango flavour and crunchy on the outside.', 2, 'images/muscatgrape.jpg'),
(37, 'SA VALENCIA ORANGE 72\'S-88\'S (PCS)', 'RM 1.70 ~ RM 2.50', 'Valencia oranges are large, round oranges with a bright orange skin. They have a thin to medium skin that peels easily. Valencia are known for their juice and have a sweet flavor.', 2, 'images/valenciaorange.jpg'),
(38, 'GENTING HONEY CHERRY TOMATO 275G', 'RM 12.90 ~ RM 19.00', 'Take a bite into this miniature bright red beauties, to taste the tiny pearl tomato as if you had drizzled honey onto it. Genting Garden Cherry Honey Tomato is the perfect, all-natural snack food.', 2, 'images/gentinghoneytomato.jpg'),
(39, 'HP CRANBERRIES ALMONDS NOUGAT 100G', 'RM 17.90 ~ RM 18.90\r\n', 'HP Cranberries Almonds Nougat, is a type of confectionery made with sugar, almonds, whipped egg whites, and added with cranberries for extra hint of fruity flavour. The consistency of nougat is chewy with almonds for the extra crunch.', 3, 'images/cranberriesalmonds.jpg'),
(40, 'FAIRCHILD\'S ORGANIC APPLE CIDER VINEGAR 946ML', 'RM 36.70 ~ RM 39.00', 'This Fairchild\'s Organic Apple Cider Vinegar is organic, unpasteurized, unfiltered, and contains the mother, which is loaded with enzymes and friendly bacteria that give the product its cloudy appearance. It\'s made with the best quality organic apples. They can be used in salads, vegetables, or even popcorn. Fairchild\'s Apple Cider Vinegar can helps maintain normal glucose levels & also can support your immune system. It is loaded with probiotics that help maintain a healthy gut.', 3, 'images/fairchild.jpg'),
(41, 'HEALTH PARADISE ORGANIC CHIA SEED TWIN PACK', 'RM 37.80 ~ RM 40.10', 'ichest plant-based source of Omega 3, dietary fibre, protein, antioxidants and gluten free. Chia historically an Aztec superfood comes from the Mayan word for strength; these seeds have been consumed as a healthy energy-sustaining food for centuries.\r\nSuggested Use: 2 tbsps. daily. Mixes easily in water or juice. Excellent when used as a topping for yogurt salad.', 3, 'images/chiaseed.jpg'),
(42, 'LOVE EARTH ORGANIC EXTRA VIRGIN COCONUT OIL 480ML', 'RM 53.90 ~ RM 57.70', '100% organic extra virgin, Made by extracting form coconut meat, Strengthens immune system and ✅Weight : 480ML', 3, 'images/virgincoconutoil.jpg'),
(43, 'LOVE EARTH FRENCH SEA SALT FINE 350G', 'RM 16.00', 'This French sea salt also known as Sel De Guerande in France, is a unique type of salt with a rich history. It has a fine texture and a delicate flavour with greyish while coloured granules. It is made by collecting evaporated salt from the surface of seawater where it is dried and grounded.', 3, 'images/seasalt.jpg'),
(44, 'LOVE EARTH ORGANIC BROWN SUGAR 800G', 'RM16.00 ~ RM16.10', 'Golden brown sugar with large homogeneous sparkling crystals. Has a crunchy, sticky texture and a rich aroma due to the presence of cane molasses.\r\n\r\nIdeal for sweetening coffee and as a crunchy topping for cakes\r\nLess processed – Has more molasses retained so contains more vitamins and minerals than regular white sugar\r\nNon-GMO\r\nKKM MESTI certified', 3, 'images/brownsugar.jpg'),
(45, 'LOVE EARTH HIMALAYA ROCK SALT (COARSE) 400G', 'RM 5.60', 'Extracted from Khewra Salt mine near the Himalayan Mountains in Pakistan, which is one of the oldest and largest salt mines in the world. It goes through natural harvesting which allows the salt to retain its minerals. It has an earthy flavour and is pink in colour due to the high amount of minerals present.\r\n\r\n100% Natural (No Chemicals & Preservative)\r\nNatural harvested from Khewra Salt mine in Pakistan\r\nB4 minerals and trace elements present\r\nRegulate fluid balance, blood pressure, and improves digestive system\r\nCan be used as an exfoliator and for salt bath\r\n Jakim HALAL Certified, KKM MESTI Certified ', 3, 'images/rocksalt.jpg'),
(46, 'LOVE EARTH HIMALAYA MINERAL ROCK SALT 400G', 'RM 5.60', '100% Nature iodine content, a salt that is 100 million year old!\r\nAbsorbs & Neutralizes toxins, allergens and irritants in your environment\r\nGives a healthy taste for your meal (porridge, vegetables, soups)\r\nMust-have tool for purifying, detoxifying & cleansing\r\nJakim HALAL Certified, KKM Mesti Certified', 3, 'images/mineralsalt.jpg'),
(47, 'CED PURE HONEY 380G / 500G', 'RM 13.10 ~ RM 17.60', 'CED Pure Honey is a natural sweetener that also acts as an energy booster, powerful immune system booster and works great for natural home remedies. Use it any way you like and appreciate the excellence.', 3, 'images/honey.jpg'),
(48, 'CED NATURAL HIMALAYAN PINK ROCK SALT 500G', 'RM 4.00 ~ RM 4.30', 'The CED Pink Himalayan Salt creates an electrolyte balance to increase hydration. The product is able to regulate water content both inside and outside of cells. It is also capable of balancing pH (alkaline/acidity) and help to reduce acid reflux and lower blood pressure.', 3, 'images/pinkrocksalt.jpg'),
(49, 'LADY\'S CHOICE REAL MAYONNAISE JAR 220ML/ 470ML', 'RM 10.20 ~ RM 17.10', 'Lady\'s Choice Real Mayonnaise made with real eggs, healthy oils, and a rich spice blend. Turn your ordinary meals into extraordinary moments by adding a creamy and delicious twist to your favorite dishes!', 4, 'images/MAYONNAISE.jpg'),
(50, 'PLANTA MULTIPURPOSE MARGARINE 240G / 480G / 1KG / 2.5KG', 'RM 8.90 ~ RM 70.00', 'Planta MultiPurpose Margarine is ideal for spreading, cooking and baking. It has an iconic aroma and taste that no other can mimic. It\'s not only delicious but also nutritious with Vitamins A, B1, B2, B6, B12, D, E, Niacin and Folic Acid.', NULL, 'images/PLANTA.jpg'),
(51, 'OKI BUTTERLIVE OLIVE OIL BLENDED SPREAD 250G', 'RM 8.90 ~ RM 10.30', 'Oki Butterlive Olive Oil Blended Spread provides a smooth and creamy texture, making it easy to spread on bread, toast, or use in cooking and baking. It can be used as a substitute for traditional butter in various recipes, adding a delightful hint of salt and the distinct taste of olive oil.', 4, 'images/BUTTERLIVE.jpg'),
(52, 'CHESDALE CHEESE SLICE 125G/250G/500G', 'RM 10.10 ~ RM 33.60', 'CHESDALE Processed Cheese Slices is a processedindividually wrapped cheese slice. It has a medium cheese flavour and slightlyelastic body. Perfect for gourmet burger and sandwich application.', 4, 'images/CHESDALECHEESE.jpg '),
(53, 'ARLA WHIPPING CREAM 200ML', 'RM 10.70 ~ RM 11.50', 'Arla Whipping Cream has the right flavor to complement a variety of dishes such as cakes, ice cream and various types of desserts. With the right thickness, soft and creamy texture, it can be used as a mixture of ingredients to add flavor to your dishes.', 4, 'images/ARLA WHIPPING CREAM.jpg'),
(54, 'OKI GOLD CREAM CHEESE 250G/500G', 'RM 14.80 ~ RM 31.50', 'OKI Gold Cream Cheese is a creamy and indulgent cheese product that is often used as a spread or ingredient in various dishes and desserts. It is made from high-quality milk and cream, resulting in a rich and smooth texture. It\'s offers a versatile flavor profile that can range from mildly tangy to slightly sweet, depending on the specific brand and recipe. It can be enjoyed on its own, spread on bread or crackers, or incorporated into recipes such as cheesecakes, pastries, and savory dishes.', 4, 'images/OKI GOLD CREAM CHEESE.jpg'),
(55, 'NUTELLA 200G\r\n', 'RM 13.30 ~ RM 14.80', 'Nutella contains authentic hazelnuts and cocoa, its unique creaminess adds flavor to bland tasting bread. Nutellas original taste of hazelnut and cocoa makes it everyone\'s favorite breakfast companion', 4, 'images/NUTELLA.jpg'),
(56, 'EMBORG WHIPPED CREAM SPRAY 250G', 'RM 23.30 ~ RM 27.80', 'Emborg Whipped Cream is made from natural whipping cream. With a slightly sweetened flavor, it is convenient and perfect on desserts, milkshakes and hot chocolates.', 4, 'images/EMBORG WHIPPED CREAM SPRAY.jpg'),
(57, 'DAISY MARGARINE 240G', 'RM 6.40 ~ RM 7.10', 'Daisy Margarine is versatile for other different applications such as cooking, pan-frying, barbeque and roasting. Daisy Margarine is cholesterol free and enriched with 9 vitamins; hence, it is ideal to use as bread spread for healthy growing children and families.', 4, 'images/DAISY MARGARINE.jpg'),
(58, 'FRIZZ BUTTERLITE DAIRY SPREAD 250G', 'RM 7.90 ~ RM 9.10', 'Frizz Butterlite Dairy Spread considered as churned margarine which is made by blending margarine and butter to give a similar taste to pure butter for baking or can even be used in your cooking. Just like other butter blend, it\'s bring a full goodness of taste, aroma and texture to your table.', 4, 'images/FRIZZ BUTTERLITE DAIRY.jpg'),
(59, 'EMBORG UHT WHIPPING CREAM 1L', 'RM 38.00 ~ RM 50.00', 'Emborg Whipping cream and Whip Topping are full bodied creams with a fresh, natural creamy flavour.\r\nOur whipping cream has a great versatility across multiple applications such as desserts, pastry and sauces.\r\nWhen the cream is whipped, it has an excellent volume and stability, which makes it perfect for cake filling and topping.', 4, 'images/EMBORG UHT WHIPPING CREAM.jpg'),
(60, 'MARIGOLD SWEETENED CONDENSED FILLED MILK 505G', 'RM 5.40 ~ RM 6.80', 'Enriched with Vitamin A & D\r\nNo Cholesterol MG EC: light and creamy taste that\'s full or richness.\r\nThe perfect complement for desserts, fruit juice and ice kacang', 4, 'images/MARIGOLD SWEETENED CONDENSED FILLED MILK.jpg'),
(61, 'MARIGOLD KOPI & TEH TARIK SWEETENED CREAMER 500G', 'RM 4.30 ~ RM 4.50', 'Marigold Sweetened Creamer is great to be used for coffee and tea brewing. It making your drinks taste even better and smoothly frothy.\r\n\r\nContain no cholesterol\r\nRich in vitamin A, D & B1', 4, 'images/MARIGOLD KOPI & TEH TARIK SWEETENED CREAMER.jpg'),
(62, 'F&N EVAPORATED FILLED MILK 390G', 'RM 6.00', 'F&N Evaporated Milk is made from quality ingredients for a tasty guarantee. This range of products complements all types of culinary cooking.', 4, 'images/F&N EVAPORATED FILLED MILK.jpg'),
(63, 'F&N EVAPORATED CREAMER 390G', 'RM 5.10 ~ RM 5.60', 'F&N Evaporated Creamer is made from quality ingredients for a tastier choice. This product is an excellent ingredient for all types of cooking with its natural goodness.\r\n\r\n\r\n\r\nCholesterol and trans fatty acid free\r\nHigh in vitamins A and D3\r\nGood source of calcium and protein', 4, 'images/F&N EVAPORATED CREAMER.jpg'),
(64, 'SALTED TOFU 200G', 'RM 1.80 ~ RM 2.40', 'Tofu is an ideal choice for replacing animal cheese, due to its valuable nutritional composition and pleasant taste thanks to the iodized salt added to this assortment. Obtained from fresh soy beverage and processed similar to milk, tofu is noted for its high content of vegetable protein, calcium and vitamin K.', 5, 'images/SALTED TOFU.jpg'),
(65, 'JAPANESE EGG TOFU 220G', 'RM 1.70 ~ RM 2.30', 'Egg tofu is a special kind of tofu made with soy milk and eggs and it have similar taster with soft tofu.', 5, 'images/JAPANESE EGG TOFU.jpg'),
(66, 'NUTRIPLUS KLASIK EGG (M) 10\'S', 'RM 5.80 ~ RM 8.60', 'Packed Fresh From The Farm After Careful Selection\r\nNutriPlus Classic Eggs Enriched With Added Vitamins E And B-Complex.\r\nCan Be Consumed In So Many Ways – Hard-Boiled, Scrambled Or Poached, As Omelettes Or On Toasts, Baked Into Cakes, Biscuits And Pastries', 5, 'images/NUTRIPLUS KLASIK EGG.jpg'),
(67, 'WHITE TOFU 2\'S', 'RM 3.20', 'White tofu is a food made by coagulating cooked soymilk and then pressing it into soft curds. Retaining most of the nutrients in soymilk, tofu has a bland flavor and white color and provides a texture that is smooth, firm, and coherent, but not hard or rubbery. It\'s low in calories but high in protein and fat. It also contains many important vitamins and minerals, including calcium and manganese.', 5, 'images/WHITE TOFU.jpg'),
(68, 'SMOOTH BEANCURD 300G', 'RM 1.70 ~ RM 2.30', 'Tofu, also known as bean curd, is a type of food made by coagulating soy milk and then pressing the curds into soft white blocks\r\n\r\nlow in fat, but high in protein\r\nNo preservative added', 5, 'images/SMOOTH BEANCURD.jpg'),
(69, 'JAPANESE EGG TOFU 130G', 'RM 1.40', 'Egg tofu is a specific type of tofu. Whereas regular tofu is made out of just soy milk, egg tofu is made out of soy milk and eggs\r\n\r\nhigh-protein\r\nlow-calorie food', 5, 'images/JAPANESE EGG TOFU.jpg'),
(70, 'SLY MEE KUNING 500G', 'RM 1.80 ~ RM 2.20', 'SLY Mee Kuning\r\n\r\nThere are various types of dishes that can be made with this mee kuning.\r\nSome are fried, some have gravy, especially those curry noodles, boiled noodles, soup noodles, hailam noodles, bandung noodles and many more that can be found in Malaysia.\r\nMamak fried noodles are also among the popular favourites these days. Mamak stalls mostly can be found in peninsular Malaysia.\r\n✅ Weight: 500G', 5, 'images/SLY MEE KUNING.jpg'),
(71, 'SLY KUEH TIAW 500G', 'RM 1.80 ~ RM 2.80', 'SLY Kueh Tiaw\r\n\r\n-Oftenly used by stallholders and vendors in the making of Char kueh tiaw.\r\n\r\n-Char kueh tiaw is a stir fried Chinese-inspired rice noodle dish from Maritime Southeast Asia.\r\n\r\n-The dish has achieved widespread popularity within the region from the late 20th century onwards, particularly in Malaysia and Singapore.', 5, 'images/SLY KUEH TIAW.jpg'),
(72, 'WHOLE CHICKEN 1.7KG / 1.3KG/ 1.6KG', 'RM 18.00 ~ RM 21.10', 'Chicken is a great source of many key nutrients, including protein, niacin, selenium, and phosphorus.\r\nHighly nutritious and a good source of protein. Adding chicken to your diet may help support weight loss, muscle growth, and bone health.\r\nGrilling, baking, and stir-frying chicken are a few of the healthiest ways to enjoy chicken', 6, 'images/WHOLE CHICKEN.jpg'),
(73, 'CHICKEN SKIN 300G', 'RM 2.20 ~ RM 2.80', 'Tasted better when deep fried and serve as snacks.', 6, 'images/CHICKEN SKIN.jpg'),
(74, 'CHICKEN LEG MEAT 1KG', 'RM 20.70 ~ RM 21.90', 'An excellent source of many essential nutrients. Iron and zinc, which are important for a healthy immune system, are present in much higher quantities in dark meat than in white meat.', 6, 'images/CHICKEN LEG MEAT.jpg'),
(75, 'CHICKEN LEG BONE 1KG', 'RM 3.50 ~ RM 6.90', '', 6, 'images/CHICKEN LEG BONE.jpg'),
(76, 'CHICKEN BREAST BLSL 1KG', 'RM 19.00 ~ RM 25.30', 'Boneless, skinless chicken breasts are cut from the chest of the bird, with the tenderloin removed. They\'re quick-cooking, tender and juicy if prepared correctly. They are also a leaner choice than other cuts of chicken.', 6, 'images/CHICKEN BREAST.jpg'),
(77, 'CHICKEN BREAST BONE 1KG', 'RM 5.30 ~ RM 13.80', 'A bone-in chicken breast is just what it sounds like! It\'s a chicken breast that still has the rib bone attached.', 6, 'images/CHICKEN BREAST BONE.jpg'),
(78, 'CHICKEN DRUMMET 1KG', 'RM 15.00 ~ RM 17.90', 'Chicken drums, also known as drummies or drumettes, resemble smaller versions of the drumsticks from the chicken legs. Chicken drums are the uppermost parts of the chicken wing, and while they can contain more meat overall, they also feature large amounts of cartilage around the joint ends.\r\n\r\nDrums are ideal for dipping, thanks to the easy-to-grip large center bone.', 6, 'images/CHICKEN DRUMMET.jpg'),
(79, 'CHICKEN THIGH 1KG', 'RM 16.70 ~ RM 17.30', 'Chicken thighs are considered a great protein option for meals. It\'s also consider as an excellent source of essential micronutrients like iron and zinc in higher quantities than breasts.', 6, 'images/CHICKEN THIGH.jpg'),
(80, 'CHICKEN WING 1KG', 'RM 17.80 ~ RM 21.80', 'Taste best when roasted in oven / deep fried / barbequed.', 6, 'images/CHICKEN WING.jpg'),
(81, 'CHICKEN FEET 300G', 'RM 1.70 ~ RM 2.30', 'Great for braising\r\n\r\nPerfect thickening agent for broth as it is high in gelatin', 6, 'images/CHICKEN FEET.jpg'),
(82, 'CHICKEN BREAST WBB 1KG', 'RM 11.40 ~ RM 13.80', 'Excellent source of white lean. Great for healthy salad or a clean carb-less meal', 6, 'images/CHICKEN BREAST WBB.jpg'),
(83, 'HARVEST GOURMET PUFF 300G', 'RM 26.50', 'Korean Gochujang - This spicy and savory pastry is a flavor explosion, perfectly balanced with authentic Korean gochujang sauce\r\nCreamy Curry - This aromatic pastry envelops tender mince and a harmonious fusion of fragrant spices in each and every bite.\r\nOriental BBQ - Bite into the flaky pastry filled with tender, savory BBQ goodness', 7, 'images/HARVEST GOURMET PUFF.jpg'),
(84, 'FIRST PRIDE TEMPURA CHICKEN NUGGETS 700G', 'RM 26.30', 'Salted egg - are made with tender, juicy chicken and coated in a crispy tempura batter infused with the savoury flavours of salted egg. Every bite is a taste sensation, balancing the sweet notes with the saltiness of the egg!\r\nSour cream and onion - irresistible flavours of tangy sour cream and savoury onion', 7, 'images/FIRST PRIDE TEMPURA CHICKEN NUGGETS.jpg'),
(85, 'CB WAFFLE FRIES 1KG', 'RM 25.90', 'CB Waffle Fries 1kg made from the finest potatoes. Full of nutrient and energy that tastes delicious. Good on its own or serve with food.', 7, 'images/CB WAFFLE FRIES.jpg'),
(86, 'QL CRAB FLAVOURED NUGGET 500G', 'RM 10.50 ~ RM 12.10', '', 7, 'images/QL CRAB FLAVOURED NUGGET.jpg'),
(87, 'HUNGRITOS FRENCH FRIES 500G', 'RM 13.70 ~ RM 14.90', 'Glaze oven tray with cooking oil. Pre-heat Oven / Airfryer to 200°C. Cook till desired crispiness / colour is achieved. Recommended cooking time 18-20 minutes', 7, 'images/HUNGRITOS FRENCH FRIES.jpg'),
(88, 'EB HOTPOT COMBO SOUP 600G', 'RM 20.60 ~ RM 22.20', '', 7, 'images/EB HOTPOT COMBO SOUP.jpg'),
(89, 'NESTLE HARVEST GOURMET GOLDEN CRUNCHY POPPERS 300G', 'RM 23.00', 'Satisfy your cravings with our plant-powered poppers! Guilt-free, high-protein, and overflowing with fibre - these crave-worthy golden crunchy snacks are halal-certified and made with love in Malaysia. Indulge without the guilt!', 7, 'images/NESTLE HARVEST.jpg'),
(90, 'KAWAN SWEET POTATO BALL 300G', 'RM 9.70 ~ RM 12.00', 'Kawan Sweet Potato Balls a heavenly treat that perfectly balances sweetness and satisfaction. Each bite reveals a heavenly blend of soft, melt-in-your-mouth sweet potato encased in a delicate, golden-brown crust.', 7, 'images/KAWAN SWEET POTATO BALL.jpg'),
(91, 'FUSIPIM KING CRAB CLAW 500G', 'RM 12.00 ~ RM 18.40', 'Fusipim King Crab Claw can be add into your favourite dishes like spaghetti, curry noddle, fried rice or congee. You can also turn them into delightful meals for your family by deep-frying, stir-frying, grilling or by boiling.', 7, 'images/FUSIPIM KING CRAB CLAW.jpg'),
(92, 'BAY SCALLOP 60/80 500G', 'RM 36.20 ~ RM 43.70', 'Bay scallop are bite-sized like popcorn, while sea scallops are larger and resemble large marshmallows. It is  rich in omega-3 fatty acids, healthy fats, and magnesium. It is recommended to cook bay scallops by stir-frying, roasting or poaching.', 7, 'images/BAY SCALLOP.jpg'),
(93, 'QL FISH TOFU WITH SQUID 500G', 'RM 13.70', 'QL Fish Tofu With Squid is a great dish for a variety of diets, including pescatarian, vegetarian, and vegan. Not only is it tasty, but it\'s also high in protein and a good source of some essential nutrients.', 7, 'images/QL FISH TOFU WITH SQUID.jpg'),
(94, 'SUPREME MIXED VEGETABLE 400G', 'RM 3.00 ~ RM 4.80', 'Supreme Mixed Vegetable is the combination of different vegetables such as carrots, sweet corn and green peas that had been chopped, sliced and cubed. It can be prepared in a variety of ways from boiling to frying. ', 7, 'images/SUPREME MIXED VEGETABLE.jpg'),
(95, 'EB CHICKEN ROLL 600G', 'RM 18.40 ~ RM 24.00', 'Clean diced chicken meat that wrap with “Fuzhuk” bean curd skin\r\nRiches with natural spices and flavouring that bring you the juiciest bite\r\nIdeal cooking method : deep fry,air fryer and pan fry.', 7, 'images/EB CHICKEN ROLL.jpg'),
(96, 'EB FISH ROE LUCKY BAG 160G', 'RM 12.10 ~ RM 12.50', 'Oriental lucky bag outer made with Non-GMO soy bean, inner comes with premium surimi and full of fish roe make this successful combination creates an unprecedented delicacy experience.', 7, 'images/EB FISH ROE LUCKY BAG.jpg'),
(97, 'KG ROUND DUMPLING SKIN 200G', 'RM 2.90 ~ RM 3.70', 'This dumpling skin is light, strong, yet thin and elastic enough to wrap up any ingredients you can imagine for your dumplings. ', 7, 'images/KG ROUND DUMPLING SKIN.jpg'),
(98, 'KG SQUARE WANTAN SKIN 200G', 'RM 2.90 ~ RM 3.70', 'Your homemade wan tans will be crispier than ever with KG Pastry Wan Tan Pastry! This Wan Tan skin is light, strong, yet thin and elastic enough to wrap up any ingredients you can imagine for your wantans. ', 7, 'images/KG SQUARE WANTAN SKIN.jpg'),
(99, 'EB FLOWER CHEESE TOFU 380G', 'RM 11.30 ~ RM 12.10', 'A versatile fish tofu with full of cheese cube inside! Easy to cook and trans-fat free.', 7, 'images/EB FLOWER CHEESE TOFU.jpg'),
(100, 'EB FISH & YUBA 300G', 'RM 9.20 ~ RM 10.70', 'Perfect blend between nutrition fish paste and delicious yuba skin that is definitely mouth-watering! ', 7, 'images/EB FISH & YUBA.jpg'),
(101, 'LIKES TEMPURA CHICKEN NUGGET 500G', 'RM 13.20', 'Likes Tempura Chicken Nugget are made from lean chicken breast meat, coated with tempura flour to capture the succulent flavors of quality chicken', 7, 'images/LIKES TEMPURA CHICKEN NUGGET.jpg'),
(102, 'AYAMAS CHEESE CHICKEN FRANKFURTER 235G', 'RM 9.80', 'Ayamas Premium Cheese Chicken Frankfurter is made with real chickens and stuffed with premium cheese.', 7, 'images/AYAMAS CHEESE CHICKEN FRANKFURTER.jpg'),
(103, 'NESTLE GOLD CORN FLAKES ECONO PACK 500G', 'RM 17.20', 'Nestle Corn Flakes cereal is made with goodness of whole grain.', 8, 'images/NESTLE GOLD CORN FLAKES.jpg'),
(104, 'NESTLE MILO CEREAL BUDGET PACK 80G', 'RM 3.80', 'Nestle Milo Cereal comes from Milo choco malt powder and has humble Aussie roots. It contains with wholegrains, vitamins & minerals to help give children the energy.', 8, 'images/NESTLE MILO CEREAL.jpg'),
(105, 'UNCLE JAMES SCALLOP PORRIDGE 220G', 'RM 15.50', '', 8, 'images/UNCLE JAMES SCALLOP PORRIDGE.jpg'),
(106, 'KELLOGG\'S CORN FLAKES 275G\r\n', 'RM 11.30', 'Kellogg\'s Corn Flake is made from real golden corn toasted into crunchy flakes. It contains 9 different vitamins and minerals, and is packed with carbohydrates to give you the energy you need. Enjoy the classic taste of Cornflakes - breakfast is sorted.', 8, 'images/KELLOGG\'S CORN FLAKES.jpg'),
(107, 'QUAKER 3IN1 OAT CEREAL DRINK 28Gx15\'S', 'RM 12.90', 'A nutritious, tasty and practical Oat brands number 1 in the morning which helping to warm and fill the stomach to start activities.', 8, 'images/QUAKER 3IN1 OAT CEREAL DRINK.jpg'),
(108, 'CAPTAIN OATMEAL 1KG', 'RM 16.00', 'Captain Instant Oatmeal -Prepare a wholesome breakfast instantly in just 2 minutes\r\n\r\nCaptain Quick Cook Oatmeal - Prepare a wholesome breakfast instantly in just 3-5 minutes, you may add in fruits, nuts, and toppings of your choice for that extra flavor', 8, 'images/CAPTAIN OATMEAL.jpg'),
(109, 'KELLOGG\'S GRANOLA CEREAL 220G', 'RM 26.50', 'Kellogg\'s Super Berry Granola - It has crunchy crisp 5-Grain cluster combined with carefully selected berries, nuts and seeds. And thing get better since it is filled with 7 essential nutrients like Vitamin E also known as an antioxidant nutrient \r\n\r\nKellogg\'s Dark Chocolate Granola - Blends 5-grain granola with real chocolate chips made with Belgian chocolate for that crunchy chocolate experience', 8, 'images/KELLOGG\'S GRANOLA CEREAL.jpg'),
(110, 'ERAWAN RICE FLOUR 500G', 'RM 3.20', 'Erawan Blended Rice Flour is suitable to make rice noodlesand as a thickening agent in recipes. They are made from finely milled plain white rice. It is best used as a sauce thickener or as a binding agentin baked goods, and is a good alternative for wheat flour. It is gluten-free and also does not contain any bleachingagents.', 9, 'images/ERAWAN RICE FLOUR.jpg'),
(111, 'CSR BETTER WHITE CLEAR WHITE SUGAR 800G\r\n', 'RM 4.80', 'Experience the purest sweetness with CSR Better White Clear White Sugar 800g. This premium sugar is meticulously refined to deliver a flawless, crystal-clear sweetness that elevates your culinary creations.', 9, 'images/CSR BETTER WHITE CLEAR WHITE SUGAR.jpg'),
(112, 'ADABI FRITTER FLOUR 200G', 'RM 5.20', 'Adabi Fritter Flour is the gold standard of afternoon tea snack loved by all Malaysians, young and old. The special blend contains all the necessary ingredients to make a complete fritter, no modification required. Just add water!', 9, 'images/ADABI FRITTER FLOUR.jpg'),
(113, 'OREO CRUMBS SMALL CRUSHED COOKIES PIECES 454G', 'RM 13.80', 'Oreo crumbs small crushed cookies pieces 454G are crushed into bits, perfect as condiment and baking ingredient. It crushed into small pieces, making it the best ingredient for desserts, milkshakes and cakes.', 9, 'images/OREO CRUMBS.jpg'),
(114, 'CSR ICING SUGAR 500G', 'RM 4.00', 'CSR Icing Sugar is a powdered sugar with a smooth texture. It contains corn starch as an anti-caking agent, and is easily combined with fast dissolve rate. CSR Icing Sugar can be used to make goodies such as shortbread, cream fillings, marshmallow, and fondant. This product is halal certified.', 9, 'images/CSR ICING SUGAR.jpg'),
(115, 'BR MIXED FRUITS 100G', 'RM 6.90', '', 9, 'images/BR MIXED FRUITS.jpg'),
(116, 'BR AGAR-AGAR STRIP 20G', 'RM 5.30', 'Agar-Agar strips are made from premium-grade seaweeds. They are boiled with water and made into refreshing jellies together with added fruit pieces and/or coconut milk.', 9, 'images/BR AGAR-AGAR STRIP.jpg'),
(117, 'GREEN HORSE WHEAT FLOUR 1KG', 'RM 4.10', 'Green Horse White Flour is suitable for making cakes, pancakes, biscuits, cookies and as batter for frying chicken, fish and others.', 9, 'images/GREEN HORSE WHEAT FLOUR.jpg'),
(118, 'KG SPRING ROLL PASTRY 5\" 200G', 'RM 4.30', 'KG Pastry spring roll pastry turns delightfully crispy and golden brown when deep fried just right, enhancing the flavour of your spring rolls.', 9, 'images/KG SPRING ROLL PASTRY.jpg'),
(119, 'BESTARI WHEAT STARCH 350G', 'RM 3.70 ', 'Contains unique properties and is also a food thickener for numerous cooking recipes. It is ideal in the preparation of shrimp dumplings (har gau), rice sheet rolls (Cheong fun), flat noodles (kueh teow), pudding, cookies, gravies, and sauces.', 9, 'images/BESTARI WHEAT STARCH.jpg'),
(120, 'BESTARI TEMPURA BATTER 500G', 'RM 7.50', 'Use Bestari Tempura Flour to deep fry any meat, chicken, vegetables, seafood, fruits, or any other things that you can think of. Gives a lighter and crispier coating,\r\nLess oil for frying giving a healthier meal, and Enhance the flavor of meats, fish and poultry', 9, 'images/BESTARI TEMPURA BATTER.jpg'),
(121, 'BESTARI TAPIOCA STARCH 350G', 'RM 2.90', 'Used as a thickening agent for gravies, sauces, soups and etc.\r\nCan mixed with other flours to make kuih, cakes, cookies', 9, 'images/BESTARI TAPIOCA STARCH.jpg'),
(122, 'MATAHARI AGAR-AGAR 30G', 'RM 5.10', '', 9, 'images/MATAHARI AGAR-AGAR.jpg'),
(123, 'SHM GULA HITAM 100G', 'RM 3.60', '', 9, 'images/SHM GULA HITAM.jpg'),
(124, 'SHM CORN FLOUR 400G', 'RM 2.80', '', 9, 'images/SHM CORN FLOUR.jpg'),
(125, 'HAMADAYA JAPANESE ODEN SOUP BASE 300ML', 'RM 16.10', 'Oden is a traditional Japanese one-pot dish enjoyed in Japan especially during the colder months. Made as a soup base, it brings together Hamadaya\'s 200-year-old secret soy sauce blend with a delicate touch of kelp and mushrooms.', 10, 'images/HAMADAYA JAPANESE ODEN SOUP BASE.jpg'),
(126, 'MAGGI AYAM PERCIK 100G', 'RM 5.50', 'Maggi Ayam Percik 100g made from fresh ingredients – onions and the perfect combination of spices to produce balance and delicious taste. Complete paste, just marinate & fry!', 10, 'images/MAGGI AYAM PERCIK.jpg'),
(127, 'NISSIN IRVINS INSTANT NOODLES 113G X 5\'S', 'RM 34.70', 'Salted Egg - Indulge in this perfect combination of classic mee pok noodle and savory salted egg seasoning topped off with spring onion and egg crumbs. Spicy Salted Egg - The added spiciness of the hot boom salted egg version is sure to bring the spicy kick you need for your instant noodle cravings.', 10, 'images/NISSIN IRVINS INSTANT NOODLES.jpg'),
(128, 'HONEY B SPARKLING DRINK 250ML', 'RM 4.30', 'Honey - Made from 100% premium Australia\'s natural honey. No added sugar, no added colouring and no added flavouring.\r\nHoney Black Tea - A honey ready-to-drink (RTD) canned beverage. A Honey B natural honey carbonated drink with added Black Tea', 11, 'images/HONEY B SPARKLING DRINK.jpg'),
(129, 'WONDA COFFEE 240ML', 'RM 3.00', '', 11, 'images/WONDA COFFEE.jpg'),
(130, 'RIBENA CHEERPACK 330ML', 'RM 4.00', 'Ribena Mobile Cheerpack is without  artificial colors, sweeteners or flavorings, Ribena provides 100 percent of our daily vitamin C requirements. It is even more convenient to enjoy your favorite drink especially on busy mornings.', 11, 'images/RIBENA CHEERPACK.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotionID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL COMMENT 'cannot be after end date',
  `end_date` date NOT NULL COMMENT 'cannot be before start date',
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotionID`, `productID`, `title`, `description`, `start_date`, `end_date`, `code`) VALUES
(1, 1, 'Sweet Corn Special', 'Buy 1 Get 1 Free on CCK Sweet Corn 500G. Perfect for a healthy snack or side dish!', '2024-11-01', '2024-11-15', 'SWEETCORNBOGO'),
(2, 2, 'Chicken Nuggets Discount', 'Get 20% off on CCK Chicken Nuggets 450G. Ideal for quick and tasty meals!', '2024-11-05', '2024-11-20', 'NUGGETS20'),
(3, 3, 'Minced Beef Bonanza', 'Save $2 on each pack of CCK Minced Beef 400G. Great for hamburgers or pasta dishes!', '2024-11-10', '2024-11-25', 'BEEFSAVE2'),
(4, 4, 'Fish Ball Deal', 'Enjoy 15% off on CCK Fish Ball (S) 500G. Perfect for soups and hotpots!', '2024-11-15', '2024-11-30', 'FISHBALL15'),
(5, 5, 'Satay Beef Fest', 'Buy CCK Satay Beef 300G and get a free peanut sauce! Limited-time offer.', '2024-11-18', '2024-12-05', 'SATAYFREE'),
(6, 6, 'Mixed Veggie Offer', '10% off on CCK Mix Vegetables 900G. Great for stir-fries and soups!', '2024-11-20', '2024-12-10', 'VEGGIE10');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `recipeID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipeID`, `productID`, `title`, `description`, `image`) VALUES
(1, 1, 'Baked Parmesan Cheese Corn', '-CCK SWEET CORN\r\n\r\nIngredients：\r\n1/2 cup mayonnaise\r\n1/2 teaspoon ground black pepper\r\n1/2 teaspoon garlic salt\r\n2 teaspoons sugar\r\n1 tablespoon grated parmesan cheese\r\n1/2 cup shredded parmesan cheese, divided\r\nParsley flakes, for garnish\r\n\r\nInstructions：\r\nStep1: Preheat the oven to 380°F (198°C). In a large bowl, combine 2 cans of sweet corn, mayonnaise, ground black pepper, garlic salt, sugar, grated Parmesan cheese, and half of the shredded Parmesan cheese. Stir well with a spatula.\r\n\r\nStep 2: Pour the mixture into a baking dish and sprinkle the remaining shredded Parmesan cheese on top.\r\n\r\nStep 3: Bake for 20 to 30 minutes, or until the cheese is melted and bubbly.\r\n\r\nStep 4: Remove from the oven and serve immediately, garnished with additional shredded Parmesan cheese and parsley flakes, if desired.\r\n\r\nNotes:\r\n-To make this dish creamer, you may substitute one can of sweet whole-kernel corn with cream-style corn to add richness.\r\n\r\n-Add a cheesy topping to the dish with more kinds of cheese. You may broil the dish for an extra 5 minutes with a cup of mozzarella cheese evenly sprinkled on top. Let the cheese melt and drizzle down.\r\n\r\n-Give the dish a spicy kick with some paprika sprinkled on top before serving.', '[\"recipe_image/Baked Parmesan Cheese Corn_1.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_2.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_3.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_4.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_5.jpg\"]'),
(2, 3, 'Fried Popiah', '-CCK MINCED BEEF\r\n\r\nIngredients:\r\n1 pack spring roll wrappers\r\n3 tablespoons cooking oil\r\n2 cloves garlic, chopped finely\r\n150 g (5 oz) baby shrimp, chopped finely\r\n5-6 dried shitake mushrooms, soaked and chopped finely\r\n200 g (7 oz) yam bean, sliced\r\n100 g (3½ oz) carrot, sliced\r\n\r\nSeasonings:\r\n1 teaspoon chicken stock granules\r\n1/2 teaspoon salt\r\n1 dash pepper\r\n1 cup water\r\n1 teaspoon oyster sauce\r\n1 tablespoon cornstarch, mix with water\r\n\r\nlour Mixture:\r\n2 tablespoons plain flour\r\n4 tablespoons water\r\n\r\nInstructions:\r\nStep 1: In a wok, heat the cooking oil. Add the garlic and stir-fry until aromatic. Then, add the CCK MINCED BEEF, shrimp, and mushrooms, and continue to stir-fry until cooked.\r\n\r\nStep 2：Add the yam bean and carrot, and stir-fry for 1-2 minutes. Then, add 1 cup of water, cover with a lid, and simmer for 15-20 minutes until the vegetables are tender. Add the seasoning ingredients and mix well. Dish out and set aside.\r\n\r\nStep 3: Place a piece of spring roll wrapper on a flat surface. Add 2 spoonfuls of filling to the center of the wrapper, then fold in the two sides and roll it up. Use the flour mixture to seal the edges.\r\n\r\nStep 4: Heat a wok and pour in 2 cups of cooking oil. Deep fry the spring rolls over medium heat until golden brown and crispy. Remove them and drain on paper towels. Serve hot with chili sauce.\r\n\r\nNotes:\r\n-When you’re adding the filling to the wrappers, keep it simple—don’t overstuff! When you’re adding the filling to the wrappers, keep it simple—don’t overstuff! Two spoonfuls is just right; otherwise, it gets messy.\r\n\r\n-Keep an eye on your oil temperature at around 350°F (175°C) while frying. If it’s too hot, the outside will burn before the inside cooks, and if it’s too cool, your popiah will soak up too much oil and get greasy.\r\n\r\n-Don’t overcrowd the pan! Frying in small batches helps everything cook evenly and stay nice and crispy.', '[\"recipe_image/popiah_1.jpg\",\"recipe_image/popiah_2.webp\",\"recipe_image/popiah_3.webp\",\"recipe_image/popiah_4.webp\",\"recipe_image/popiah_5.webp\"]'),
(3, 11, 'Ginger Scallion Fish', '-CCK BREADED POLLOCK FILLET\r\n\r\nIngredients:\r\n1 1/2 tablespoons oil\r\n2- inch ginger, skin peeled and cut into thin slices\r\n2 stalks scallion, cut into 2-inch lengths (5 cm)\r\n\r\nMarinade:\r\n1 teaspoon cornstarch\r\n1 teaspoon Shaoxing wine\r\n\r\nSauce:\r\n1/2 tablespoon soy sauce\r\n1/2 tablespoon oyster sauce\r\n1/2 teaspoon cornstarch\r\n1 teaspoon sugar\r\n1/4 teaspoon sesame oil\r\n3-4 tablespoons water\r\nSalt to taste\r\n3 dashes white pepper powder\r\n\r\nInstructions:\r\nStep 1: Marinate the fish for about 10 minutes. Mix the sauce ingredients in a small bowl and set aside.\r\n\r\nStep 2: Heat up the wok with cooking oil. Add ginger slices to the wok when the oil is very hot. Stir-fry the ginger until aromatic, then add the fish fillet. Stir-fry the fish until it is half cooked.\r\n\r\nStep 3: Add the sauce and continue to stir-fry until the fish is cooked through. If the sauce dries out, add a little water. Add the chopped scallions and stir briefly. Dish out and serve hot.\r\n\r\nNotes:\r\n-Using fresh ginger and scallions will enhance the flavor of the dish. Avoid using old or wilted ingredients.\r\n\r\n-Opt for firm-fleshed fish fillets like Basa, tilapia, or cod that can withstand stir-frying without falling apart.\r\n\r\n-Make sure your wok or pan is hot enough before adding ingredients. This helps to quickly stir-fry and sear the fish without overcooking.\r\n\r\n-If the sauce becomes too thick or dries out during cooking, add a splash of water to adjust the consistency.', '[\"recipe_image/Ginger Scallion Fish_1.jpg\",\"recipe_image/Ginger Scallion Fish_2.jpg\",\"recipe_image/Ginger Scallion Fish_3.webp\",\"recipe_image/Ginger Scallion Fish_4.webp\",\"recipe_image/Ginger Scallion Fish_5.webp\"]'),
(4, 6, 'Spam Fried Rice', '-CCK MIX VEGETABLES 900G\r\n\r\nIngredients：\r\n3 cups overnight steamed rice\r\n2 1/2 tablespoons oil\r\n3 large eggs, lightly beaten\r\n2 cloves garlic, minced\r\n6 oz (170g) spam, cut into small cubes\r\n1 cup frozen mixed vegetables, thaw and defrost\r\nsalt, to taste\r\n\r\nSeasonings:\r\n1 1/2 tablespoons soy sauce\r\n1/2 tablespoon fish sauce\r\n1/2 teaspoon sesame oil\r\n3 dashes ground white pepper\r\n\r\nInstructions：\r\n\r\nStep 1: Break up the lumpy overnight rice using the back of a spoon, a fork, or your hand. In a small bowl, mix all the ingredients for the Seasonings.\r\n\r\nStep 2: Heat 1/2 tablespoon of the oil in a wok over high heat and cook the eggs, breaking them into small pieces with a spatula. Set aside. Reheat the wok with the remaining 2 tablespoons of oil and stir-fry the garlic until aromatic.\r\n\r\nStep 3: Add the spam pieces and stir-fry until they are light brown, then add the mixed vegetables. Stir to combine well.\r\n\r\nStep 4: Add the rice to the wok and use the spatula to stir-fry continuously until all the ingredients are well blended. Add the seasonings, mixing thoroughly with the rice and other ingredients. Return the cooked eggs to the wok and combine with the rice. Dish out and serve immediately.', '[\"recipe_image/Spam Fried Rice_ (1).jpg\",\"recipe_image/Spam Fried Rice_ (1).png\",\"recipe_image/Spam Fried Rice_ (2).jpg\",\"recipe_image/Spam Fried Rice_ (3).jpg\",\"recipe_image/Spam Fried Rice_5.webp\"]'),
(5, 12, 'Teriyaki Beef Meatballs', '-CCK PREMIO BEEF BALL 500G\r\n\r\nIngredients:\r\noil, for shallow frying\r\n1/3 cup Japanese mirin, sweet rice wine\r\n2 tablespoons soy sauce\r\n1 tablespoon sugar\r\nwhite sesame, optional\r\nscallion , or cilantro, chopped, optional\r\n\r\nInstructions:\r\nStep 1:Heat a pan or skillet with some oil and shallow-fry the meatballs until they are lightly browned and cooked through.\r\n\r\nStep 2: Remove the excess oil from the pan or skillet. Lower the heat to medium-low and add the Japanese mirin, soy sauce, and sugar. Stir well with the chicken meatballs. Simmer and cook until the sauce slightly thickens, about 5 minutes.\r\n\r\nStep 3: Top with sesame seeds and chopped scallions or cilantro, if desired. Dish out and serve immediately.', '[\"recipe_image/Teriyaki Chicken Meatballs_ (1).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (2).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (3).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (4).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (5).jpg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `spin_history`
--

CREATE TABLE `spin_history` (
  `spinID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `reward_value` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `memberID` varchar(32) NOT NULL,
  `spinID` int(11) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`memberID`, `spinID`, `phoneNumber`) VALUES
('1111111111', NULL, 1111111111);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `claim`
--
ALTER TABLE `claim`
  ADD PRIMARY KEY (`claimID`);

--
-- Indexes for table `daily_wheel`
--
ALTER TABLE `daily_wheel`
  ADD PRIMARY KEY (`rewardID`);

--
-- Indexes for table `exist_member`
--
ALTER TABLE `exist_member`
  ADD PRIMARY KEY (`existsmemID`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`gameID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `fk_product_category` (`category`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotionID`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipeID`);

--
-- Indexes for table `spin_history`
--
ALTER TABLE `spin_history`
  ADD PRIMARY KEY (`spinID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`memberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `claim`
--
ALTER TABLE `claim`
  MODIFY `claimID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_wheel`
--
ALTER TABLE `daily_wheel`
  MODIFY `rewardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exist_member`
--
ALTER TABLE `exist_member`
  MODIFY `existsmemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `gameID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `spin_history`
--
ALTER TABLE `spin_history`
  MODIFY `spinID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category`) REFERENCES `categories` (`categoryID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
