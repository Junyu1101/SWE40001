-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2024 at 08:07 AM
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
  `claim_date` date NOT NULL COMMENT 'claiming date resets after midnight',
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
(2, '1111111111', '1111111111'),
(3, '1111111112', '1111111112'),
(4, '1111111113', '1111111113');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `gameID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `gameLink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`gameID`, `title`, `description`, `image`, `gameLink`) VALUES
(1, 'Match 3', 'A game where you swap tiles to match and score! Earn at least 300 points to get a reward!', '[\"images\\/match3-banner.png\"]', '../match3-gamever4/index.html');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `category` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `name`, `price`, `description`, `category`, `image`) VALUES
(1, 'CCK SWEET CORN 500G', 5.00, 'One of the main nutritional benefits of sweetcorn is its high fibre content. And as we know, dietary fibre is important for our health: it aids digestion, it can decrease the risk of heart disease, strokes.\r\nOn top of that, fibre helps you stay fuller for longer just like consuming potatoes.\r\n', 1, '[\"images/corn_product.jpeg\"]'),
(2, 'CCK CHICKEN NUGGETS 450G', 10.00, 'food product consisting of a small piece of deboned chicken meat that is breaded or battered\r\nSuggest cooking method : Deep fried or air-fryer\r\nWeight: 900g', 1, '[\"images/chickennuggets.jpeg\"]'),
(3, 'CCK MINCED BEEF 400G', 13.00, 'Minced beef or beef mince is beef that has been finely chopped with a knife or a meatgrinder or mincing machine.\r\nIt is used in many recipes including hamburgers,spaghetti Bolognese and also used many other Asian cookings.', 1, '[\"images/mincedbeef.jpeg\"]'),
(4, 'CCK FISH BALL (S) 500G', 9.00, 'Fish balls are balls made from fish paste which are then boiled or deep-fried.', 1, '[\"images/fishball.jpeg\"]'),
(5, 'CCK SATAY BEEF 300G', 26.00, 'Marinated overnight with spices, skewed to satay and grilled.\r\nBest eaten with local peanut sauce taste juicy and nutty.', 1, '[\"images/sataybeef.jpeg\"]'),
(6, 'CCK MIX VEGETABLES 900G', 8.00, 'Variety of vegetables mixed in one pack\r\nSuitable for cooking fried rice, soups, dumplings , etc.\r\nConvenient to cook', 1, '[\"images/mixvege.jpeg\"]'),
(7, 'CCK CHICKEN BURGER 900G', 14.00, 'No defrosting is required before cooking; simply heat the pan to 175°C-180°C and cook each side for 3 to 4 minutes.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1, '[\"images/chickenburger.jpeg\"]'),
(8, 'UNIIFOOD CHICKEN DIM SUM 400G', 17.00, 'Uniifood Chicken Dim Sum is suitable for steam.', 1, '[\"images/dimsum.jpeg\"]'),
(9, 'CCK ORIGINAL CHICKEN FRANK 300G', 5.00, 'Suitable to be eaten as a side dish or as accompaniment in fried rice. \r\nCan be cooked in many ways : Fried, BBQ, Steamboat/Hotpot or cooked in Soup\r\nHalal', 1, '[\"images/orichickenfrank.jpeg\"]'),
(10, 'CCK BREADED POLLOCK FINGER 400G', 16.00, 'Enjoy 16 pieces of Halal-certified deep-sea pollock fish coated in a crunchy breading, rich in omega-3 fatty acids and protein, with a 400g box offering a 24-month shelf life. Conveniently cook from frozen using your preferred method—deep fry at 175-180°C for 2-3 minutes, air fry at 200-220°C for 5-8 minutes, or oven heat at 200-220°C for 5-8 minutes. Perfect for appetizers, fish and chips, children’s meals, fried platters, fish tacos, or sandwich wraps!\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1, '[\"images/pollockfinger.jpeg\"]'),
(11, 'CCK BREADED POLLOCK FILLET 450G', 16.00, 'Enjoy 6 pieces of Halal-certified deep-sea pollock fish coated in crunchy breading, packed in a 450g box with a 24-month shelf life. Rich in omega-3 fatty acids and protein, these fish fillets are easy to cook from frozen. Simply deep fry at 175-180°C for 3-4 minutes or air fry at 200°C for 7-8 minutes. Perfect for serving with fries, potatoes, pickles, lemon, in a sandwich, taco, or bun!\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1, '[\"images/pollockfillet.jpeg\"]'),
(12, 'CCK PREMIO BEEF BALL 500G', 14.00, '', 1, '[\"images/premiobeefball.jpeg\"]'),
(13, 'CCK CRAB MEAT STICK 200G', 3.00, 'Suitable for steamboat, hotpot, BBQ & soups. For storage keep frozen at -18°C and do not refreeze.', 1, '[\"images/crabstick.jpeg\"]'),
(14, 'CCK SEAFOOD MASTER SALAD SALMON 60G', 8.00, 'Available in three delicious flavors: Smoked, Sweet BBQ, and Rattan Pepper.', 1, '[\"images/saladsalmon60.jpeg\"]'),
(15, 'CCK SATAY CHICKEN 300G', 15.00, 'Marinated overnight with spices, skewed to satay and grilled. Best eaten with local peanut sauce taste juicy and nutty.', 1, '[\"images/sataychicken.jpeg\"]'),
(16, 'CCK GOLDEN FISH CAKE 450G', 10.00, 'It is somewhat like a sausage made of fish meat. It is a simple, tasty and affordable version of a dish for fish\r\nTaste savory with soft texture and can have various flavors depending on the additional ingredient', 1, '[\"images/fishcake450g.jpeg\"]'),
(17, 'CCK CHICKEN BALL 400G', 10.00, '✅Weight: 400g, Defrost is not needed.\r\nBoil fish balls in boiling water for 4-5 minutes or fry the fish balls in hot oil at 170°C-180°C for 3-4 minutes.', 1, '[\"images/chickenball.jpeg\"]'),
(18, 'CCK FISH FILLET 700G', 13.70, 'There are several advantages to filleting fish for cooking. It reduces the cooking time and makes it easier to portion and eat. It is particularly useful for bigger fish, especially meatier varieties that don\'t easily fall apart. Filleting also allows you to eat the fish over several meals.', 1, '[\"images/fishfillet700g.jpeg\"]'),
(19, 'CCK CHICKEN NUGGETS 900G', 16.10, 'This 900g pack of breaded or battered deboned chicken pieces is perfect for a quick and delicious meal. Ideal cooking methods include deep frying or using an air fryer for crispy perfection.', 1, '[\"images/chicnugget900g.jpeg\"]'),
(20, 'CCK SQUID TUBE 500G', 16.90, '24 Months Shelf Life and Halal Certified. Todaroes Pacificus, STTP Treated.\r\n', 1, '[\"images/squidtube500g.jpeg\"]'),
(21, 'CCK WHITE FISH CAKE 500G', 9.20, 'Fish Meat, Potato Starch, Salt, Sugar, Monosodium Glutamate and Garlic.\r\n', 1, '[\"images/whitefishcake.jpeg\"]'),
(22, 'CCK BREADED SALMON FINGER 400G', 14.90, '16pcs/box, 24 Months Shelf Life, Halal Certified. Wild Salmon, Coated in a crunchy breading\r\nRich in omega-3 fatty acids, Protein\r\nCook from frozen, easy to cook', 1, '[\"images/salmonfinger400g.jpeg\"]'),
(23, 'CCK HONEY CHICKEN FRANK 300G', 5.30, 'This 300g Halal-certified chicken product is versatile and perfect as a side dish or an accompaniment to fried rice. Enjoy it prepared in various ways, including frying, BBQ, steamboat/hotpot, or in soups. Made from chicken meat, soy protein, spices, and a touch of honey, it contains MSG as a permitted flavor enhancer and is crafted to deliver rich, satisfying flavors.', 1, '[\"images/honeychickenfrank.jpeg\"]'),
(24, 'CCK MINCED CHICKEN 400G', 13.30, 'Chicken Mince (ground chicken) is the white meat, leaner alternative to beef mince.\r\nBasically, anything you make with beef mince you can make with chicken mince, Rissoles, burgers, meatballs, meatloaf.', 1, '[\"images/mincedchicken.jpg\"]'),
(25, 'SNOW PEA (U)', 6.10, 'In terms of their nutrient content, snow peas are packed with vitamin A, vitamin C, iron, potassium, dietary fiber, magnesium, folic acid, and small levels of healthy fats. These pods are also very low in calories & also lack cholesterol, making them a filling, yet nutritious dietary component. There are many impressive health benefits of snow peas, including weight loss, improved heart health, reduced constipation, stronger bones, optimized immunity and lower levels of inflammation, among others. It\'s best for fried, boiled, baked or roasted.', 2, '[\"images/snowpea.jpg\"]'),
(26, 'GOLDEN NEEDLE MUSHROOM 100G', 2.00, 'Enoki mushrooms, also known as needle mushrooms (榎茸, エノキタケ) in Japanese, have a delicate, savory flavor and a satisfying crunch from their thin strands. They can be enjoyed sautéed, raw in salads, or added directly to ramen and hot pot where they cook perfectly in the broth. Well-packed for freshness, they bring a delightful texture and taste to any dish.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 2, '[\"images/goldneedlemushroom.jpg\"]'),
(27, 'POH LIAN ONION 100G', 3.50, '', 2, '[\"images/pohlianonion.jpg\"]'),
(28, 'POH LIAN DAUN SUP 80G (U)', 2.80, '', 2, '[\"images/pohliandaun.jpg\"]'),
(29, 'INDIA BOMBAY ONION 40-60MM (KG)', 5.20, '', 2, '[\"images/bombayonion.jpg\"]'),
(30, 'CHINA NAVEL ORANGE (KG)', 10.90, 'China Navel Oranges are large, spherical oranges with thick, deep-orange, loose rinds that are easy to peel.', 2, '[\"images/chinanavelorange.jpg\"]'),
(31, 'NZ DIVA APPLE 120\'S -135\'S (U)', 1.70, 'NZ Diva Apple is rich in vitamin C and high fibre to support a healthy system.', 2, '[\"images/divaapple.jpg\"]'),
(32, 'GENTING TOMATO CHERRY ASSORTED 275G', 13.20, 'Genting Tomato Cherry is pearly round or plum-shaped, sweet or tangy, red or gold, these petite treats are bursting with flavour and a succulent taste.', 2, '[\"images/gentingtomatocherry.jpg\"]'),
(33, 'NZ ENVY APPLE 120\'S-138\'S (U)', 2.10, 'Envy apples are a round variety with striated, ruby red skin with green undertones. They have a crisp, sweet white flesh that will stay pure white for up to 10 hours before succumbing to oxidation and turning brown.', 2, '[\"images/envyapple.jpg\"]'),
(34, 'SA NAVEL ORANGE 72\'S - 88\'S (PCS)', 2.50, 'Navel Orange has a round shape and dimpled, bright orange skin. They are very high in fiber which helps improve cholesterol ratios in the body. Fiber helps regulate sugar levels in the blood, aids in preventing colon cancer.', 2, '[\"images/navelorange.jpg\"]'),
(35, 'CHINA GREEN RADISH 500G', 5.30, 'China Green Radish also known as the Qingluobo radish are best known for their colour, which is bright green both inside and out. The skin is deep bright green toward the stalk, often fading to white near the roots. The flesh is also bright green though it\'s a lighter, fresher shade. The combined shades of green make for a really attractive cross section when sliced for salads or pickles.', 2, '[\"images/greenradish.jpg\"]'),
(36, 'CHINA SHINE MUSCAT GRAPE 500G', 28.70, 'China Shine Muscat Grape are bright yellow-green grapes that are sweet with a hint of mango flavour and crunchy on the outside.', 2, '[\"images/muscatgrape.jpg\"]'),
(37, 'SA VALENCIA ORANGE 72\'S-88\'S (PCS)', 1.70, 'Valencia oranges are large, round oranges with a bright orange skin. They have a thin to medium skin that peels easily. Valencia are known for their juice and have a sweet flavor.', 2, '[\"images/valenciaorange.jpg\"]'),
(38, 'GENTING HONEY CHERRY TOMATO 275G', 12.90, 'Take a bite into this miniature bright red beauties, to taste the tiny pearl tomato as if you had drizzled honey onto it. Genting Garden Cherry Honey Tomato is the perfect, all-natural snack food.', 2, '[\"images/gentinghoneytomato.jpg\"]'),
(39, 'HP CRANBERRIES ALMONDS NOUGAT 100G', 18.90, 'HP Cranberries Almonds Nougat, is a type of confectionery made with sugar, almonds, whipped egg whites, and added with cranberries for extra hint of fruity flavour. The consistency of nougat is chewy with almonds for the extra crunch.', 3, '[\"images/cranberriesalmonds.jpg\"]'),
(40, 'FAIRCHILD\'S ORGANIC APPLE CIDER VINEGAR 946ML', 38.50, 'This Fairchild\'s Organic Apple Cider Vinegar is organic, unpasteurized, unfiltered, and contains the mother, which is loaded with enzymes and friendly bacteria that give the product its cloudy appearance. It\'s made with the best quality organic apples. They can be used in salads, vegetables, or even popcorn. Fairchild\'s Apple Cider Vinegar can helps maintain normal glucose levels & also can support your immune system. It is loaded with probiotics that help maintain a healthy gut.', 3, '[\"images/fairchild.jpg\"]'),
(41, 'HEALTH PARADISE ORGANIC CHIA SEED TWIN PACK', 37.80, 'Richest plant-based source of Omega 3, dietary fibre, protein, antioxidants and gluten free. Chia historically an Aztec superfood comes from the Mayan word for strength; these seeds have been consumed as a healthy energy-sustaining food for centuries.\r\nSuggested Use: 2 tbsps. daily. Mixes easily in water or juice. Excellent when used as a topping for yogurt salad.', 3, '[\"images/chiaseed.jpg\"]'),
(42, 'LOVE EARTH ORGANIC EXTRA VIRGIN COCONUT OIL 480ML', 53.90, '100% organic extra virgin, Made by extracting form coconut meat, Strengthens immune system and ✅Weight : 480ML', 3, '[\"images/virgincoconutoil.jpg\"]'),
(43, 'LOVE EARTH FRENCH SEA SALT FINE 350G', 16.00, 'This French sea salt also known as Sel De Guerande in France, is a unique type of salt with a rich history. It has a fine texture and a delicate flavour with greyish while coloured granules. It is made by collecting evaporated salt from the surface of seawater where it is dried and grounded.', 3, '[\"images/seasalt.jpg\"]'),
(44, 'LOVE EARTH ORGANIC BROWN SUGAR 800G', 16.00, 'This golden brown sugar features large, homogeneous sparkling crystals with a crunchy, sticky texture and a rich aroma from the natural cane molasses. Ideal for sweetening coffee or as a crunchy topping for cakes, it is less processed, retaining more molasses and containing more vitamins and minerals than regular white sugar. Non-GMO and KKM MESTI certified, it’s a healthier and flavorful choice for your baking and beverages.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 3, '[\"images/brownsugar.jpg\"]'),
(45, 'LOVE EARTH HIMALAYA ROCK SALT (COARSE) 400G', 5.60, 'Extracted from the Khewra Salt Mine near the Himalayan Mountains in Pakistan, one of the oldest and largest salt mines in the world, this 100% natural pink salt retains its minerals through natural harvesting. Rich in B4 minerals and trace elements, it offers an earthy flavor and helps regulate fluid balance, blood pressure, and improve the digestive system. Additionally, it can be used as an exfoliator or in salt baths. Jakim HALAL and KKM MESTI certified for quality and safety. ', 3, '[\"images/rocksalt.jpg\"]'),
(46, 'LOVE EARTH HIMALAYA MINERAL ROCK SALT 400G', 5.60, 'This 100% natural iodine-rich salt, sourced from 100 million-year-old deposits, absorbs and neutralizes toxins, allergens, and irritants in your environment. It enhances the flavor of meals like porridge, vegetables, and soups, making it a must-have tool for purifying, detoxifying, and cleansing. Jakim HALAL and KKM MESTI certified for quality and safety.', 3, '[\"images/mineralsalt.jpg\"]'),
(47, 'CED PURE HONEY 380G', 13.20, 'CED Pure Honey is a natural sweetener that also acts as an energy booster, powerful immune system booster and works great for natural home remedies. Use it any way you like and appreciate the excellence.', 3, '[\"images/honey.jpg\"]'),
(48, 'CED NATURAL HIMALAYAN PINK ROCK SALT 500G', 4.00, 'The CED Pink Himalayan Salt creates an electrolyte balance to increase hydration. The product is able to regulate water content both inside and outside of cells. It is also capable of balancing pH (alkaline/acidity) and help to reduce acid reflux and lower blood pressure.', 3, '[\"images/pinkrocksalt.jpg\"]'),
(49, 'LADY\'S CHOICE REAL MAYONNAISE JAR 220ML', 10.20, 'Lady\'s Choice Real Mayonnaise made with real eggs, healthy oils, and a rich spice blend. Turn your ordinary meals into extraordinary moments by adding a creamy and delicious twist to your favorite dishes!', 4, '[\"images/MAYONNAISE.jpg\"]'),
(50, 'PLANTA MULTIPURPOSE MARGARINE 1KG', 24.20, 'Planta MultiPurpose Margarine is ideal for spreading, cooking and baking. It has an iconic aroma and taste that no other can mimic. It\'s not only delicious but also nutritious with Vitamins A, B1, B2, B6, B12, D, E, Niacin and Folic Acid.', 4, '[\"images/PLANTA.jpg\"]'),
(51, 'OKI BUTTERLIVE OLIVE OIL BLENDED SPREAD 250G', 8.90, 'Oki Butterlive Olive Oil Blended Spread provides a smooth and creamy texture, making it easy to spread on bread, toast, or use in cooking and baking. It can be used as a substitute for traditional butter in various recipes, adding a delightful hint of salt and the distinct taste of olive oil.', 4, '[\"images/BUTTERLIVE.jpg\"]'),
(52, 'CHESDALE CHEESE SLICE 125G', 11.40, 'CHESDALE Processed Cheese Slices is a processedindividually wrapped cheese slice. It has a medium cheese flavour and slightlyelastic body. Perfect for gourmet burger and sandwich application.', 4, '[\"images/CHESDALECHEESE.jpg \"]'),
(53, 'ARLA WHIPPING CREAM 200ML', 10.70, 'Arla Whipping Cream has the right flavor to complement a variety of dishes such as cakes, ice cream and various types of desserts. With the right thickness, soft and creamy texture, it can be used as a mixture of ingredients to add flavor to your dishes.', 4, '[\"images/ARLA WHIPPING CREAM.jpg\"]'),
(54, 'OKI GOLD CREAM CHEESE 250G', 14.80, 'OKI Gold Cream Cheese is a creamy and indulgent cheese product that is often used as a spread or ingredient in various dishes and desserts. It is made from high-quality milk and cream, resulting in a rich and smooth texture. It\'s offers a versatile flavor profile that can range from mildly tangy to slightly sweet, depending on the specific brand and recipe. It can be enjoyed on its own, spread on bread or crackers, or incorporated into recipes such as cheesecakes, pastries, and savory dishes.', 4, '[\"images/OKI GOLD CREAM CHEESE.jpg\"]'),
(55, 'NUTELLA 200G\r\n', 13.30, 'Nutella contains authentic hazelnuts and cocoa, its unique creaminess adds flavor to bland tasting bread. Nutellas original taste of hazelnut and cocoa makes it everyone\'s favorite breakfast companion', 4, '[\"images/NUTELLA.jpg\"]'),
(56, 'EMBORG WHIPPED CREAM SPRAY 250G', 23.30, 'Emborg Whipped Cream is made from natural whipping cream. With a slightly sweetened flavor, it is convenient and perfect on desserts, milkshakes and hot chocolates.', 4, '[\"images/EMBORG WHIPPED CREAM SPRAY.jpg\"]'),
(57, 'DAISY MARGARINE 240G', 6.70, 'Daisy Margarine is versatile for other different applications such as cooking, pan-frying, barbeque and roasting. Daisy Margarine is cholesterol free and enriched with 9 vitamins; hence, it is ideal to use as bread spread for healthy growing children and families.', 4, '[\"images/DAISY MARGARINE.jpg\"]'),
(58, 'FRIZZ BUTTERLITE DAIRY SPREAD 250G', 7.90, 'Frizz Butterlite Dairy Spread considered as churned margarine which is made by blending margarine and butter to give a similar taste to pure butter for baking or can even be used in your cooking. Just like other butter blend, it\'s bring a full goodness of taste, aroma and texture to your table.', 4, '[\"images/FRIZZ BUTTERLITE DAIRY.jpg\"]'),
(59, 'EMBORG UHT WHIPPING CREAM 1L', 50.00, 'Emborg Whipping cream and Whip Topping are full bodied creams with a fresh, natural creamy flavour.\r\nOur whipping cream has a great versatility across multiple applications such as desserts, pastry and sauces.\r\nWhen the cream is whipped, it has an excellent volume and stability, which makes it perfect for cake filling and topping.', 4, '[\"images/EMBORG UHT WHIPPING CREAM.jpg\"]'),
(60, 'MARIGOLD SWEETENED CONDENSED FILLED MILK 505G', 5.40, 'Enriched with Vitamin A & D.\r\nNo Cholesterol MG EC: light and creamy taste that\'s full or richness.\r\nThe perfect complement for desserts, fruit juice and ice kacang', 4, '[\"images/MARIGOLD SWEETENED CONDENSED FILLED MILK.jpg\"]'),
(61, 'MARIGOLD KOPI & TEH TARIK SWEETENED CREAMER 500G', 4.30, 'Marigold Sweetened Creamer is great to be used for coffee and tea brewing. It making your drinks taste even better and smoothly frothy. Contain no cholesterol and rich in vitamin A, D & B1.', 4, '[\"images/MARIGOLD KOPI & TEH TARIK SWEETENED CREAMER.jpg\"]'),
(62, 'F&N EVAPORATED FILLED MILK 390G', 6.00, 'F&N Evaporated Milk is made from quality ingredients for a tasty guarantee. This range of products complements all types of culinary cooking.', 4, '[\"images/F&N EVAPORATED FILLED MILK.jpg\"]'),
(63, 'F&N EVAPORATED CREAMER 390G', 5.10, 'F&N Evaporated Creamer is made from quality ingredients for a tastier choice. This product is an excellent ingredient for all types of cooking with its natural goodness.\r\nCholesterol and trans fatty acid free,\r\nHigh in vitamins A and D3,\r\nGood source of calcium and protein.', 4, '[\"images/F&N EVAPORATED CREAMER.jpg\"]'),
(64, 'SALTED TOFU 200G', 1.80, 'Tofu is an ideal choice for replacing animal cheese, due to its valuable nutritional composition and pleasant taste thanks to the iodized salt added to this assortment. Obtained from fresh soy beverage and processed similar to milk, tofu is noted for its high content of vegetable protein, calcium and vitamin K.', 5, '[\"images/SALTED TOFU.jpg\"]'),
(65, 'JAPANESE EGG TOFU 220G', 1.70, 'Egg tofu is a special kind of tofu made with soy milk and eggs and it have similar taster with soft tofu.', 5, '[\"images/JAPANESE EGG TOFU.jpg\"]'),
(66, 'NUTRIPLUS KLASIK EGG (M) 10\'S', 6.90, 'Packed Fresh From The Farm After Careful Selection\r\nNutriPlus Classic Eggs Enriched With Added Vitamins E And B-Complex.\r\nCan Be Consumed In So Many Ways – Hard-Boiled, Scrambled Or Poached, As Omelettes Or On Toasts, Baked Into Cakes, Biscuits And Pastries', 5, '[\"images/NUTRIPLUS KLASIK EGG.jpg\"]'),
(67, 'WHITE TOFU 2\'S', 3.20, 'White tofu is a food made by coagulating cooked soymilk and then pressing it into soft curds. Retaining most of the nutrients in soymilk, tofu has a bland flavor and white color and provides a texture that is smooth, firm, and coherent, but not hard or rubbery. It\'s low in calories but high in protein and fat. It also contains many important vitamins and minerals, including calcium and manganese.', 5, '[\"images/WHITE TOFU.jpg\"]'),
(68, 'SMOOTH BEANCURD 300G', 1.70, 'Tofu, also known as bean curd, is a type of food made by coagulating soy milk and then pressing the curds into soft white blocks\r\n\r\nlow in fat, but high in protein\r\nNo preservative added', 5, '[\"images/SMOOTH BEANCURD.jpg\"]'),
(69, 'JAPANESE EGG TOFU 130G', 1.40, 'Egg tofu is a high-protein, low-calorie food made from a blend of soy milk and eggs, offering a unique twist on traditional tofu.', 5, '[\"images/JAPANESE EGG TOFU.jpg\"]'),
(70, 'SLY MEE KUNING 500G', 2.00, 'There are various types of dishes that can be made with this mee kuning.\r\nSome are fried, some have gravy, especially those curry noodles, boiled noodles, soup noodles, hailam noodles, bandung noodles and many more that can be found in Malaysia.\r\nMamak fried noodles are also among the popular favourites these days. Mamak stalls mostly can be found in peninsular Malaysia.\r\n', 5, '[\"images/SLY MEE KUNING.jpg\"]'),
(71, 'SLY KUEH TIAW 500G', 2.10, 'Often used by stallholders and vendors in the making of Char Kueh Tiaw, a stir-fried Chinese-inspired rice noodle dish from Maritime Southeast Asia, this popular dish has gained widespread fame in Malaysia and Singapore since the late 20th century.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 5, '[\"images/SLY KUEH TIAW.jpg\"]'),
(72, 'WHOLE CHICKEN 1.7KG', 18.00, 'Chicken is a great source of many key nutrients, including protein, niacin, selenium, and phosphorus.\r\nHighly nutritious and a good source of protein. Adding chicken to your diet may help support weight loss, muscle growth, and bone health.\r\nGrilling, baking, and stir-frying chicken are a few of the healthiest ways to enjoy chicken', 6, '[\"images/WHOLE CHICKEN.jpg\"]'),
(73, 'CHICKEN SKIN 300G', 2.80, 'Tasted better when deep fried and serve as snacks.', 6, '[\"images/CHICKEN SKIN.jpg\"]'),
(74, 'CHICKEN LEG MEAT 1KG', 21.90, 'An excellent source of many essential nutrients. Iron and zinc, which are important for a healthy immune system, are present in much higher quantities in dark meat than in white meat.', 6, '[\"images/CHICKEN LEG MEAT.jpg\"]'),
(75, 'CHICKEN LEG BONE 1KG', 6.90, '', 6, '[\"images/CHICKEN LEG BONE.jpg\"]'),
(76, 'CHICKEN BREAST BLSL 1KG', 19.00, 'Boneless, skinless chicken breasts are cut from the chest of the bird, with the tenderloin removed. They\'re quick-cooking, tender and juicy if prepared correctly. They are also a leaner choice than other cuts of chicken.', 6, '[\"images/CHICKEN BREAST.jpg\"]'),
(77, 'SPLIT BREAST CHICKEN 1KG\r\n', 10.90, 'Chicken breast is a low fat source of protein that contains zero carbs. A healthy choice for your diet.', 6, '[\"images/SPLIT BREAST CHICKEN.jpg\"]'),
(78, 'CHICKEN DRUMMET 1KG', 17.90, 'Chicken drums, also known as drummies or drumettes, resemble smaller versions of the drumsticks from the chicken legs. Chicken drums are the uppermost parts of the chicken wing, and while they can contain more meat overall, they also feature large amounts of cartilage around the joint ends.\r\n\r\nDrums are ideal for dipping, thanks to the easy-to-grip large center bone.', 6, '[\"images/CHICKEN DRUMMET.jpg\"]'),
(79, 'CHICKEN LEG QUARTER 1KG\r\n', 15.90, 'This package contains both drumstick and thigh pieces, perfect for roasting in the oven or air fryer at 180°C for 20-25 minutes. Ideal for making delicious Western stew.', 6, '[\"images/CHICKEN LEG QUARTER.jpg\"]'),
(80, 'CHICKEN WING 1KG', 17.80, 'Taste best when roasted in oven / deep fried / barbequed.', 6, '[\"images/CHICKEN WING.jpg\"]'),
(81, 'CHICKEN GIZZARD 300G', 3.50, 'Perfect for stir-frying, this ingredient is rich in zinc and iron, essential for forming red blood cells, supporting DNA production, and aiding in wound healing. However, it should be consumed in moderation due to its high cholesterol content.', 6, '[\"images/CHICKEN GIZZARD.jpg\"]'),
(82, 'CHICKEN BREAST WBB 1KG', 11.40, 'Excellent source of white lean. Great for healthy salad or a clean carb-less meal', 6, '[\"images/CHICKEN BREAST WBB.jpg\"]'),
(83, 'HARVEST GOURMET PUFF 300G', 26.50, 'Experience a burst of flavors with our pastries: Korean Gochujang delivers a spicy and savory kick with authentic Korean sauce, Creamy Curry wraps tender mince in aromatic spices for a satisfying bite, and Oriental BBQ offers flaky pastry filled with tender, smoky BBQ goodness.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 7, '[\"images/HARVEST GOURMET PUFF.jpg\"]'),
(84, 'FIRST PRIDE TEMPURA CHICKEN NUGGETS 700G', 26.30, 'Salted egg - are made with tender, juicy chicken and coated in a crispy tempura batter infused with the savoury flavours of salted egg. Every bite is a taste sensation, balancing the sweet notes with the saltiness of the egg!\r\nSour cream and onion - irresistible flavours of tangy sour cream and savoury onion', 7, '[\"images/FIRST PRIDE TEMPURA CHICKEN NUGGETS.jpg\"]'),
(85, 'CB WAFFLE FRIES 1KG', 25.90, 'CB Waffle Fries 1kg made from the finest potatoes. Full of nutrient and energy that tastes delicious. Good on its own or serve with food.', 7, '[\"images/CB WAFFLE FRIES.jpg\"]'),
(86, 'QL CRAB FLAVOURED NUGGET 500G', 10.50, '', 7, '[\"images/QL CRAB FLAVOURED NUGGET.jpg\"]'),
(87, 'ML SOTONG PASTE 1KG', 19.10, 'ML Sotong Paste is easy to use with great stickiness that hold other meat pastes together, so that they won\'t fall apart while you\'re cooking them.', 7, '[\"images/ML SOTONG PASTE.jpg\"]'),
(88, 'EB HOTPOT COMBO SOUP 600G', 21.90, '', 7, '[\"images/EB HOTPOT COMBO SOUP.jpg\"]'),
(89, 'NESTLE HARVEST GOURMET GOLDEN CRUNCHY POPPERS 300G', 23.00, 'Satisfy your cravings with our plant-powered poppers! Guilt-free, high-protein, and overflowing with fibre - these crave-worthy golden crunchy snacks are halal-certified and made with love in Malaysia. Indulge without the guilt!', 7, '[\"images/NESTLE HARVEST.jpg\"]'),
(90, 'KAWAN SWEET POTATO BALL 300G', 12.00, 'Kawan Sweet Potato Balls a heavenly treat that perfectly balances sweetness and satisfaction. Each bite reveals a heavenly blend of soft, melt-in-your-mouth sweet potato encased in a delicate, golden-brown crust.', 7, '[\"images/KAWAN SWEET POTATO BALL.jpg\"]'),
(91, 'FUSIPIM KING CRAB CLAW 500G', 12.00, 'Fusipim King Crab Claw can be add into your favourite dishes like spaghetti, curry noddle, fried rice or congee. You can also turn them into delightful meals for your family by deep-frying, stir-frying, grilling or by boiling.', 7, '[\"images/FUSIPIM KING CRAB CLAW.jpg\"]'),
(92, 'BAY SCALLOP 60/80 500G', 38.40, 'Bay scallop are bite-sized like popcorn, while sea scallops are larger and resemble large marshmallows. It is  rich in omega-3 fatty acids, healthy fats, and magnesium. It is recommended to cook bay scallops by stir-frying, roasting or poaching.', 7, '[\"images/BAY SCALLOP.jpg\"]'),
(93, 'QL FISH TOFU WITH SQUID 500G', 13.70, 'QL Fish Tofu With Squid is a great dish for a variety of diets, including pescatarian, vegetarian, and vegan. Not only is it tasty, but it\'s also high in protein and a good source of some essential nutrients.', 7, '[\"images/QL FISH TOFU WITH SQUID.jpg\"]'),
(94, 'SUPREME MIXED VEGETABLE 400G', 4.30, 'Supreme Mixed Vegetable is the combination of different vegetables such as carrots, sweet corn and green peas that had been chopped, sliced and cubed. It can be prepared in a variety of ways from boiling to frying. ', 7, '[\"images/SUPREME MIXED VEGETABLE.jpg\"]'),
(95, 'SAMYANG BULDAK DUMPLING 700G\r\n', 47.70, 'Samyang Buldak Dumpling is an exquisite combination of Samyang Buldak Stir-fried noodles sauce and chewy gyoza dumplings. When steamed, you can enjoy Samyang Buldak Steamed Dumplings with a chewy texture and spicy taste. If you eat it grilled, you can eat it as a savory and spicy fried chicken dumpling with a crispy texture.', 7, '[\"images/SAMYANG BULDAK DUMPLING.jpg\"]'),
(96, 'EB FISH ROE LUCKY BAG 160G', 12.10, 'Oriental lucky bag outer made with Non-GMO soy bean, inner comes with premium surimi and full of fish roe make this successful combination creates an unprecedented delicacy experience.', 7, '[\"images/EB FISH ROE LUCKY BAG.jpg\"]'),
(97, 'KG ROUND DUMPLING SKIN 200G', 3.70, 'This dumpling skin is light, strong, yet thin and elastic enough to wrap up any ingredients you can imagine for your dumplings. ', 7, '[\"images/KG ROUND DUMPLING SKIN.jpg\"]'),
(98, 'KG SQUARE WANTAN SKIN 200G', 3.70, 'Your homemade wan tans will be crispier than ever with KG Pastry Wan Tan Pastry! This Wan Tan skin is light, strong, yet thin and elastic enough to wrap up any ingredients you can imagine for your wantans. ', 7, '[\"images/KG SQUARE WANTAN SKIN.jpg\"]'),
(99, 'EB FLOWER CHEESE TOFU 380G', 11.30, 'A versatile fish tofu with full of cheese cube inside! Easy to cook and trans-fat free.', 7, '[\"images/EB FLOWER CHEESE TOFU.jpg\"]'),
(100, 'EB FISH & YUBA 300G', 9.20, 'Perfect blend between nutrition fish paste and delicious yuba skin that is definitely mouth-watering! ', 7, '[\"images/EB FISH & YUBA.jpg\"]'),
(101, 'LIKES TEMPURA CHICKEN NUGGET 500G', 13.20, 'Likes Tempura Chicken Nugget are made from lean chicken breast meat, coated with tempura flour to capture the succulent flavors of quality chicken', 7, '[\"images/LIKES TEMPURA CHICKEN NUGGET.jpg\"]'),
(102, 'AYAMAS CHEESE CHICKEN FRANKFURTER 235G', 9.80, 'Ayamas Premium Cheese Chicken Frankfurter is made with real chickens and stuffed with premium cheese.', 7, '[\"images/AYAMAS CHEESE CHICKEN FRANKFURTER.jpg\"]'),
(103, 'NESTLE GOLD CORN FLAKES ECONO PACK 500G', 17.20, 'Nestle Corn Flakes cereal is made with goodness of whole grain.', 8, '[\"images/NESTLE GOLD CORN FLAKES.jpg\"]'),
(104, 'NESTLE MILO CEREAL BUDGET PACK 80G', 3.90, 'Nestle Milo Cereal comes from Milo choco malt powder and has humble Aussie roots. It contains with wholegrains, vitamins & minerals to help give children the energy.', 8, '[\"images/NESTLE MILO CEREAL.jpg\"]'),
(105, 'UNCLE JAMES SCALLOP PORRIDGE 220G', 16.00, '', 8, '[\"images/UNCLE JAMES SCALLOP PORRIDGE.jpg\"]'),
(106, 'KELLOGG\'S CORN FLAKES 275G\r\n', 11.30, 'Kellogg\'s Corn Flake is made from real golden corn toasted into crunchy flakes. It contains 9 different vitamins and minerals, and is packed with carbohydrates to give you the energy you need. Enjoy the classic taste of Cornflakes - breakfast is sorted.', 8, '[\"images/KELLOGG\'S CORN FLAKES.jpg\"]'),
(107, 'QUAKER 3IN1 OAT CEREAL DRINK 28Gx15\'S', 12.90, 'A nutritious, tasty and practical Oat brands number 1 in the morning which helping to warm and fill the stomach to start activities.', 8, '[\"images/QUAKER 3IN1 OAT CEREAL DRINK.jpg\"]'),
(108, 'CAPTAIN OATMEAL 1KG', 16.00, 'Start your day with Captain Oatmeal! Captain Instant Oatmeal is ready in just 2 minutes for a quick and wholesome breakfast, while Captain Quick Cook Oatmeal takes 3-5 minutes and lets you customize with fruits, nuts, and your favorite toppings for added flavor.', 8, '[\"images/CAPTAIN OATMEAL.jpg\"]'),
(109, 'KELLOGG\'S GRANOLA CEREAL 220G', 26.50, 'Kellogg\'s Super Berry Granola - It has crunchy crisp 5-Grain cluster combined with carefully selected berries, nuts and seeds. And thing get better since it is filled with 7 essential nutrients like Vitamin E also known as an antioxidant nutrient \r\n\r\nKellogg\'s Dark Chocolate Granola - Blends 5-grain granola with real chocolate chips made with Belgian chocolate for that crunchy chocolate experience', 8, '[\"images/KELLOGG\'S GRANOLA CEREAL.jpg\"]'),
(110, 'ERAWAN RICE FLOUR 500G', 3.30, 'Erawan Blended Rice Flour is suitable to make rice noodlesand as a thickening agent in recipes. They are made from finely milled plain white rice. It is best used as a sauce thickener or as a binding agentin baked goods, and is a good alternative for wheat flour. It is gluten-free and also does not contain any bleachingagents.', 9, '[\"images/ERAWAN RICE FLOUR.jpg\"]'),
(111, 'CSR BETTER WHITE CLEAR WHITE SUGAR 800G\r\n', 4.80, 'Experience the purest sweetness with CSR Better White Clear White Sugar 800g. This premium sugar is meticulously refined to deliver a flawless, crystal-clear sweetness that elevates your culinary creations.', 9, '[\"images/CSR BETTER WHITE CLEAR WHITE SUGAR.jpg\"]'),
(112, 'ADABI FRITTER FLOUR 200G', 5.20, 'Adabi Fritter Flour is the gold standard of afternoon tea snack loved by all Malaysians, young and old. The special blend contains all the necessary ingredients to make a complete fritter, no modification required. Just add water!', 9, '[\"images/ADABI FRITTER FLOUR.jpg\"]'),
(113, 'OREO CRUMBS SMALL CRUSHED COOKIES PIECES 454G', 13.80, 'Oreo crumbs small crushed cookies pieces 454G are crushed into bits, perfect as condiment and baking ingredient. It crushed into small pieces, making it the best ingredient for desserts, milkshakes and cakes.', 9, '[\"images/OREO CRUMBS.jpg\"]'),
(114, 'CSR ICING SUGAR 500G', 4.00, 'CSR Icing Sugar is a powdered sugar with a smooth texture. It contains corn starch as an anti-caking agent, and is easily combined with fast dissolve rate. CSR Icing Sugar can be used to make goodies such as shortbread, cream fillings, marshmallow, and fondant. This product is halal certified.', 9, '[\"images/CSR ICING SUGAR.jpg\"]'),
(115, 'BR MIXED FRUITS 100G', 6.90, '', 9, '[\"images/BR MIXED FRUITS.jpg\"]'),
(116, 'BR AGAR-AGAR STRIP 20G', 5.30, 'Agar-Agar strips are made from premium-grade seaweeds. They are boiled with water and made into refreshing jellies together with added fruit pieces and/or coconut milk.', 9, '[\"images/BR AGAR-AGAR STRIP.jpg\"]'),
(117, 'GREEN HORSE WHEAT FLOUR 1KG', 3.20, 'Green Horse White Flour is suitable for making cakes, pancakes, biscuits, cookies and as batter for frying chicken, fish and others.', 9, '[\"images/GREEN HORSE WHEAT FLOUR.jpg\"]'),
(118, 'KG SPRING ROLL PASTRY 5\" 200G', 4.30, 'KG Pastry spring roll pastry turns delightfully crispy and golden brown when deep fried just right, enhancing the flavour of your spring rolls.', 9, '[\"images/KG SPRING ROLL PASTRY.jpg\"]'),
(119, 'BESTARI WHEAT STARCH 350G', 3.70, 'Contains unique properties and is also a food thickener for numerous cooking recipes. It is ideal in the preparation of shrimp dumplings (har gau), rice sheet rolls (Cheong fun), flat noodles (kueh teow), pudding, cookies, gravies, and sauces.', 9, '[\"images/BESTARI WHEAT STARCH.jpg\"]'),
(120, 'BESTARI TEMPURA BATTER 500G', 7.50, 'Use Bestari Tempura Flour to deep fry any meat, chicken, vegetables, seafood, fruits, or any other things that you can think of. Gives a lighter and crispier coating,\r\nLess oil for frying giving a healthier meal, and Enhance the flavor of meats, fish and poultry', 9, '[\"images/BESTARI TEMPURA BATTER.jpg\"]'),
(121, 'BESTARI TAPIOCA STARCH 350G', 2.90, 'Used as a thickening agent for gravies, sauces, soups and etc.\r\nCan mixed with other flours to make kuih, cakes, cookies', 9, '[\"images/BESTARI TAPIOCA STARCH.jpg\"]'),
(122, 'MATAHARI AGAR-AGAR 30G', 5.10, '', 9, '[\"images/MATAHARI AGAR-AGAR.jpg\"]'),
(123, 'SHM GULA HITAM 100G', 3.60, '', 9, '[\"images/SHM GULA HITAM.jpg\"]'),
(124, 'MUHIBAH FLOUR 1KG\r\n', 4.50, '', 9, '[\"images/MUHIBAH FLOUR.jpg\"]'),
(125, 'HAMADAYA JAPANESE ODEN SOUP BASE 300ML', 16.10, 'Oden is a traditional Japanese one-pot dish enjoyed in Japan especially during the colder months. Made as a soup base, it brings together Hamadaya\'s 200-year-old secret soy sauce blend with a delicate touch of kelp and mushrooms.', 10, '[\"images/HAMADAYA JAPANESE ODEN SOUP BASE.jpg\"]'),
(126, 'MAGGI AYAM PERCIK 100G', 5.50, 'Maggi Ayam Percik 100g made from fresh ingredients – onions and the perfect combination of spices to produce balance and delicious taste. Complete paste, just marinate & fry!', 10, '[\"images/MAGGI AYAM PERCIK.jpg\"]'),
(127, 'NISSIN IRVINS INSTANT NOODLES 113G X 5\'S', 34.70, 'Savor the perfect blend of classic mee pok noodles and savory salted egg seasoning with the **Salted Egg** flavor, topped with spring onions and egg crumbs. For a fiery twist, try the **Spicy Salted Egg** version, delivering the ultimate spicy kick to satisfy your instant noodle cravings.', 10, '[\"images/NISSIN IRVINS INSTANT NOODLES.jpg\"\r\n]'),
(128, 'HONEY B SPARKLING DRINK 250ML', 4.30, 'Experience the purity of Honey, made from 100% premium Australian natural honey with no added sugar, coloring, or flavoring. For a refreshing twist, try Honey Black Tea, a ready-to-drink carbonated beverage combining natural Honey B honey with the bold taste of black tea.', 11, '[\"images/HONEY B SPARKLING DRINK.jpg\"]'),
(129, 'WONDA COFFEE 240ML', 3.10, 'Indulge in our creamy and aromatic coffee selections: **Original**, crafted with smooth, creamy coffee milk and a classic flavor; **Latte**, infused with the rich taste of French vanilla; **Mocha**, blending coffee milk with a hint of deep chocolate; **Kopi Tarik**, brewed from premium beans to capture Malaysia’s favorite local coffee taste; and **Extra Presso**, delivering a bold coffee punch for an extra kick to your day.', 11, '[\"images/WONDA COFFEE.jpg\"]'),
(130, 'RIBENA CHEERPACK 330ML', 4.00, 'Ribena Mobile Cheerpack is without  artificial colors, sweeteners or flavorings, Ribena provides 100 percent of our daily vitamin C requirements. It is even more convenient to enjoy your favorite drink especially on busy mornings.', 11, '[\"images/RIBENA CHEERPACK.jpg\"]'),
(131, 'SAN REMO LARGE INSTANT LASAGNA SHEETS 250G', 6.40, 'This instant lasagna is in rectangular shape used as a sheet for your lasagna. Now, you can easily make your lasagna as this sheet is oven ready and required no pre.', 10, '[\"images/LARGE INSTANT LASAGNA.jpg\"]'),
(132, 'MAGGI HOMEMADE CHICKEN STOCK 250G', 10.90, 'Maggi Homemade Chicken Stock 250G is a great, versatile addition to any dish. The stock may be used in various ways, from soups and stews to pasta dishes and gravies, and it always comes out tasting great. Use the stock\'s concentrated taste as a marinade for your meats.', 10, '[\"images/MAGGI HOMEMADE CHICKEN STOCK.jpg\"]'),
(133, 'MAHSURI KOREAN STYLE GARLIC FLAVOURED SAUCE 410ML', 7.80, 'Mahsuri Korean Styled Garlic Flavoured Sauce is perfect to glazing your fried chicken. To be more creative, consider using this sauce as a base for your vegetable dishes or marinade your meat. Style at your own !', 10, '[\"images/MAHSURI KOREAN STYLE GARLIC FLAVOURED SAUCE.jpg\"]'),
(134, 'MAHSURI BLACK PEPPER SAUCE 490G', 8.90, 'Mahsuri Black Pepper Sauce is made using Borneo black pepper. This sauce will enhance your favorite recipes with its authentic black pepper taste and is suitable for cooking, dipping and pouring.', 10, '[\"images/MAHSURI BLACK PEPPER SAUCE.jpg\"]'),
(135, 'MAK NYONYA INSTANT ASAM FISH SAUCE 200G', 7.90, '', 10, '[\"images/MAK NYONYA INSTANT ASAM.jpg\"]'),
(136, 'KARA COCONUT CREAM POWDER 50G', 2.90, 'Kara Coconut Cream Powder is a quick and easy way to cook Thai, Vietnamese or Indian dishes and others like curries, desserts, cocktails, confectionery, fillings for waffles, doughnuts, puddings and yogurt is by using this instant coconut cream powder. Just dissolve and mix in hot water and you\'ll get that rich creamy liquid.\r\n', 10, '[\"images/KARA COCONUT CREAM POWDER.jpg\"]'),
(137, 'KIMBALL CHILLI SAUCE 725G', 8.90, 'Kimball\'s own unique recipe – spiciness that s just \'ngam. This favourite Malaysian condiment spices up any Asian or western dish. It also makes a great dip for all kinds of finger foods.', 10, '[\"images/KIMBALL CHILLI SAUCE.jpg\"]'),
(138, 'BABA\'S SOUP MIX POWDER 125G', 5.50, 'Baba\'s Soup Mix Powder is made from clean, pure and finest quality spices, processed by using modern techniques and packed according to strict hygienic standards. This powder is used to enhance the taste of soup.', 10, '[\"images/BABA\'S SOUP MIX POWDER.jpg\"]'),
(139, 'AYAM BRAND ASAM PEDAS PASTE 180G', 6.00, 'Now you can make your own asam pedas dish at home in just a few simple step! ', 10, '[\"images/AYAM BRAND ASAM PEDAS PASTE.jpg\"]'),
(140, 'SAMYANG BULDAK EXTREME HOT CHICKEN FLAVOUR SAUCE 200G', 33.40, 'Samyang Buldak Extreme Hot Chicken Flavor Sauce can be used in anything, from a dipping sauce for your fried foods to packing a punch in your soups and stir fries. ', 10, '[\"images/SAMYANG BULDAK EXTREME HOT CHICKEN FLAVOUR SAUCE.jpg\"]'),
(141, 'MI RAKYAT KOSONG 1100G', 8.60, '', 10, '[\"images/MI RAKYAT KOSONG.jpg\"]'),
(142, 'STK KENTUCKY ALL PURPOSE SEASONED FLOUR 200G', 2.10, 'STK Kentucky Seasoned Flour boasts the perfect blend of spices. It\'s suitable for frying chicken, steaks, gizzards, livers, catfish, tilapia and much more. Expect the crunchy and delicious fried dishes with this flour.', 10, '[\"images/STK KENTUCKY ALL PURPOSE SEASONED FLOUR.jpg\"]'),
(143, 'DAVIDDOFF INSTANT COFFEE', 37.00, 'Experience the **Rich Aroma**, a luxurious blend of South American and East African beans, savor the **Fine Aroma** with its mild yet elegant taste, or indulge in the bold and premium flavor of **Expresso 57**, crafted from 100% Arabica beans for the ultimate coffee experience.', 11, '[\"images/DAVIDDOFF INSTANT COFFEE.jpg\"]'),
(144, 'CHEK HUP PREMIX COFFEE LATTE CUP 28G', 5.50, 'Chek Hup Premix Cofffee Latte Cup 28G is a milky, creamy and mild brew made with microground® Colombian coffee beans and no artificial flavoring. Sweetened to taste with healthier, Chek Hup Crystal rock sugar.', 11, '[\"images/CHEK HUP PREMIX COFFEE LATTE.jpg\"]'),
(145, 'DILMAH SINGLE ORIGIN HANDPICKED CEYLON TEA 300ML', 11.50, 'Start your day with the smooth, full-bodied elegance of **Royal English Black Tea**, savor the floral and creamy harmony of **Rose and French Vanilla Green Tea**, or indulge in the gentle sweetness and bright freshness of **Arabian Jasmine Green Tea**, each crafted for a uniquely delightful tea experience.', 11, '[\"images/DILMAH SINGLE ORIGIN.jpg\"]'),
(146, '100PLUS 1.5L\r\n', 4.50, 'Enhancing Endurance Through Hydration\r\n\r\nPeak performance is driven by two things – passion and a healthy body. Loaded with glucose and minerals, 100PLUS keeps your body properly hydrated for optimum bodily function and speedy recovery. With that extra advantage, your body is even better equipped to keep up with your thirst for success.', 11, '[\"images/100PLUS.jpg\"]'),
(147, 'COCA-COLA 1.5L', 4.50, 'Refresh yourself with the classic taste of **Coca-Cola Rasa Asli**, savor the lighter option of **Coca-Cola Light** with no sugar and fewer kilojoules, indulge in the smooth vanilla twist of **Coca-Cola Vanilla**, or enjoy the bold flavor of **Coca-Cola Zero Sugar**, all offering a perfect way to elevate any moment.', 11, '[\"images/COCA-COLA.jpg\"]'),
(148, 'VITAMILK SOYA BEAN MILK 300ML', 2.90, 'Enjoy the creamy richness of **Vitamilk Original Soya Bean Milk**, made from fresh whole soybeans, a perfect protein-packed choice for vegans and the lactose intolerant, or treat yourself to the indulgent sweetness of **Vitamilk Double Choco Shake Soya Bean Milk**, featuring a double chocolate boost for a deliciously healthy and energizing drink.', 11, '[\"images/VITAMILK SOYA BEAN MILK.jpg\"]'),
(149, 'BOH TEA 3 IN 1 600G', 19.40, 'Formulated to pack in all the full-bodied flavour of BOH, this is the taste of BOH in a stick pack. Just empty one stick pack of BOH tea mix into a cup or mug. Pour in boiling water, stir, and it’s ready to serve. So easy!', 11, '[\"images/BOH TEA 3 IN 1.jpg\"]'),
(150, 'CHEK HUP LOCAL BREW INSTANT COFFEE 300G/336G', 14.40, 'Savor the authentic richness of **Chek Hup Kopi Tarik**, crafted with medium-dark roasted Brazilian coffee beans and creamy goodness, or enjoy the unique blend of **Chek Hup Cham Tarik**, combining Brazilian coffee, Kenyan black tea, and rich condensed milk for a perfectly balanced, aromatic indulgence.', 11, '[\"images/CHEK HUP LOCAL BREW INSTANT COFFEE.jpg\"]'),
(151, 'KOPIKO L.A COFFEE 24\'SX20G', 16.70, 'Kopiko, your coffee specialist as one of the largest coffee producer in south east asia, relentlessly strive to make you the best cup of coffee to suit your needs & occasions in various flavor & format. Enjoy!', 11, '[\"images/KOPIKO L.A COFFEE.jpg\"]'),
(152, 'MILO CAN 240ML', 3.30, 'Milo is the perfect companion for you to enjoy your favorite chocolate malt drink anywhere, anytime. From studying to working out to chilling with friends, MILO Original Can is available as a quick and convenient chocolate malt drink to keep refreshed and re-energized while providing the nutrients you need to keep going.', 11, '[\"images/MILO CAN.jpg\"]'),
(153, 'RIBENA SPARKLING DRINK 325ML', 3.10, 'Sparkling Ribena Cans is a lightly sparkling variant of the classic blackcurrant drink, offering the same goodness in a can, with a fizzy twist to excite the palate! It\'s is free from artificial flavour, colour and sweetener, plus its also caffeine-free.', 11, '[\"images/RIBENA SPARKLING DRINK.jpg\"]'),
(154, 'VIDA ZERO SPARKLING WATER 325ML', 3.10, 'Experience guilt-free indulgence with **zero calories**, **zero sugar**, **zero coloring**, **zero fat**, and **zero cholesterol**!', 11, '[\"images/VIDA ZERO.jpg\"]'),
(155, 'MILO ACTIV-GO 2KG', 50.50, 'Natural goodness of cocoa, milk and malt to fuel you to take on your day. a unique combination of PROTOMALT, vitamins and minerals that provides an efficient release of energy to help them take on the day. It also contains a source of nutrient that play a role in efficient energy release, muscle function and bone maintenance essential functions for physical activity in children. It provides protein, calcium, iron and vitamin B12 to help repair body tissues, contribute to maintenance of bones, and promote red blood cell formation.', 11, '[\"images/MILO ACTIV-GO.jpg\"]'),
(156, 'NESCAFE ORIGINAL CAN 240ML', 3.40, '﻿Nescafe original has the finest blend of arabica and robusta beans, perfectly roasted and blended with milk. Taste the right balance of coffee and creaminess in a can, anytime, anywhere. Its comforting aroma and distinctive full-flavour taste, conveniently turns our medium-dark roast signature blend into a sweet coffee when you savour it in a can.', 11, '[\"images/NESCAFE ORIGINAL CAN.jpg\"]'),
(157, 'AIK CHEONG 2in1 KOPI O 20\'Sx15G', 15.00, 'Aik Cheong Kopi-O (Sugar Added) is made for coffee lovers who enjoy a little sweetness in a cup of black coffee. Press the coffee bag with spoon for better aroma. Take a sip and you’ll be amazed by the rich aroma and taste. Contains 70% coffee beans with added sugar.', 11, '[\"images/AIK CHEONG 2in1 KOPI O.jpg\"]'),
(158, 'JULIE\'S CHARM CREAM SANDWICH 172G', 8.10, 'Indulge in the ultimate treat with **Double Chocolate** cookies, featuring crunchy, decadent chocolate and smooth cream for a complete chocolate experience, or savor the perfect balance of sweetness and bitterness with **Tiramisu** cookies, filled with rich tiramisu-flavored cream.', 12, '[\"images/JULIE\'S CHARM CREAM SANDWICH.jpg\"]'),
(159, 'JACK N JILL POTATO CHIPS 60G', 3.80, 'Jack N Jill Potato Chips 60g is a crunchy flat sliced potato chips are made from 100% real potatoes. The perfect crunchy snack to accompany you when you\'re feeling the munchies. A V-Cut chips option adds more crunch to your munch.', 12, '[\"images/JACK N JILL POTATO CHIPS.jpg\"]'),
(160, 'SAMYANG HOT CHICKEN FLAVOUR ZALDDUK SNACKS 120G', 6.40, 'Snack version of the famous Samyang Zzaldduk ramen! Try this chicken flavored Korean snack that is crunchy, salty and sweet with a mild spicy aftertaste.', 12, '[\"images/SAMYANG HOT CHICKEN FLAVOUR ZALDDUK SNACKS.jpg\"]'),
(161, 'TOBLERONE DARK CHOCOLATE WITH HONEY & ALMOND NOUGAT 100G', 9.80, '', 12, '[\"images/TOBLERONE DARK CHOCOLATE WITH HONEY & ALMOND NOUGAT.jpg\"]'),
(162, 'OKE POTATO CHIPS THIN CUT 60G', 2.80, '', 12, '[\"images/OKE POTATO CHIPS THIN CUT.jpg\"]'),
(163, 'NUTELLA BISCUITS T3 FLOWPACK 41G', 4.80, 'Nutella Biscuit T3 Flowpack is known for the authentic taste of hazelnuts and cocoa, made even more irresistible by its unique creaminess\r\n\r\n', 12, '[\"images/NUTELLA BISCUITS T3 FLOWPACK.jpg\"]'),
(164, 'JULIE\'S OSBORNE CRACKERS 250G', 3.70, 'Julie\'s Osborne Crackers is born in the 1860s and named after Queen Victoria\'s favourite home, the Osborne House on the Isle of Wight, these round shape crackers bear many similarities to table crackers and deliver a light earthy taste, texture, and aroma.', 12, '[\"images/JULIE\'S OSBORNE CRACKERS.jpg\"]'),
(165, 'JULIE\'S LE-MOND LEMON SANDWICH BISCUIT 170G', 7.00, 'Julie\'s Le-mond lemon puff sandwich is lightly textured and salted, crunchy, and golden brown square puff biscuits relished with a natural lemon flavoured cream. It is a perfectly refreshing snack for any time of the day.', 12, '[\"images/JULIE\'S LE-MOND LEMON SANDWICH BISCUIT.jpg\"]'),
(166, 'DAIM CHOCOLATE BAG 200G', 22.90, 'Daim chocolate is a salty almond caramel, wrapped in a layer of soft smooth milk chocolate that literally melts in your mouth. The best thing about this sweet is the combination of soft and hard.', 12, '[\"images/DAIM CHOCOLATE BAG.jpg\"]'),
(167, 'ARNOTT\'S MINI DOUBLE CHOCOLATE BISCUITS 22G', 1.60, 'Arnott\'s Good Time Cookies are crunchy chocolate-flavored biscuits sprinkled with delicious chocolate chips that are made from quality ingredients. It\'s suitable for sharing with everyone and pack in small pouch which make it convenience and easy to bring.', 12, '[\"images/ARNOTT\'S MINI DOUBLE CHOCOLATE BISCUITS.jpg\"]');
INSERT INTO `product` (`productID`, `name`, `price`, `description`, `category`, `image`) VALUES
(168, 'CADBURY DAIRY MILK MINI CHOCOLATE DOYBAG 35PCS', 12.40, 'The classic creamy taste, 100% sustainably sourced cocoa, Snack Mindfully, Cocoa Life, Milk Chocolate & Contain 35 pcs.', 12, '[\"images/CADBURY DAIRY MILK MINI CHOCOLATE DOYBAG.jpg\"]'),
(169, 'NABATI AHH WAFER 13.5G EXTRA 20%', 7.50, 'Richeese Ahh is a corn-based extruded snack covered in abundant cream, stick-shaped and bite-size combined with two delicious choices of cream cheese & thick chocolate to produce a delightful product.', 12, '[\"images/NABATI AHH WAFER.jpg\"]'),
(170, 'CHACHO\'S 185G', 7.80, 'Twisties Chacho\'s 185G ( Cheesy Cheese, BBQ Bonanza and Spicy Curry)  are irresistibly light & crispy. They are made with 100% corn flour imported from America.', 12, '[\"images/CHACHO\'S.jpg\"]'),
(171, 'BIKA BBQ CHICKEN CHIPS 60G', 2.50, 'The taste of Bika Chicken BBQ flavor will certainly excite your palate and satisfy your snack cravings.', 12, '[\"images/BIKA BBQ CHICKEN CHIPS.jpg\"]'),
(172, 'CORNTOZ 100G', 2.80, 'Corntoz is a delicious and crunchy snack made from real corns, which are baked and roasted to perfection. Using its very own Flavaboom technology, each bite comes with an explosion of intense flavour.', 12, '[\"images/CORNTOZ.jpg\"]'),
(173, 'CHIPSMORE MULTIPACK 8\'S', 11.50, 'This sharing pack is the perfect pack for quick enjoyment with friends! This convenient portion bundle pack is perfect for a quick sweet treat on-the-go.', 12, '[\"images/CHIPSMORE MULTIPACK.jpg\"]'),
(174, 'SNEK KU MI MI 8\'S', 6.00, 'Snek Ku Mi Mi is a prawn flavor snack that has are best selling for past 40 years and has established itself as a nostalgic childhood snack.', 12, '[\"images/SNEK KU MI MI.jpg\"]'),
(175, 'KIT KAT BITES 100G', 8.60, 'KIT KAT BITES Milk Chocolate are bags of delicious bite-sized pieces of crispy wafer biscuits covered in smooth milk chocolate.', 12, '[\"images/KIT KAT BITES.jpg\"]'),
(176, 'LAY\'S BBQ POTATO CHIPS 180G', 19.00, 'It all start with farm-green potatoes, cooked and seasoned to perfection. Then, Lay\'s barbecue flavoured Potato Chip is added with the spicy flavour of BBQ Sauce. So every Lay\'s potato chip is perfectly crispy and delicious and bring happiness in every bite! BBQ flavour, No artificial flavours, & No preservatives.', 12, '[\"images/LAY\'S BBQ POTATO CHIPS.jpg\"]'),
(177, 'CLOROX MANUAL TOILET BOWL CLEANER BLEACH 500ML', 11.00, 'Get rid of rust and hard water stains with Clorox Toilet Bowl Cleaner Bleach 500ml.\r\n', 13, '[\"images/CLOROX MANUAL TOILET BOWL CLEANER BLEACH.jpg\"]'),
(178, 'VINDA PRESTIGE 4D DECO EMBOSSED FACIAL TISSUE 3X100\'S\r\n', 14.80, 'Vinda Prestige 4D Deco Embossed Facial Tissue is specially designed for facial care with Vinda\'s 4D-Deco Embossing Innovation that laminates 3ply of tissue making it even softer. It stays strong yet soft even when wet and does not leave tissue bits\r\n', 13, '[\"images/VINDA PRESTIGE 4D DECO EMBOSSED FACIAL TISSUE.jpg\"]'),
(179, 'PREMIER KITCHEN TOWELS SOFT PACK 80\'S X3\r\n', 12.90, 'Premier Soft Pack Kitchen Towel is stronger, thicker paper towel that gives better absorbent power from your oily fried food. Made from 100% pulp.\r\n', 13, '[\"images/PREMIER KITCHEN TOWELS SOFT PACK.jpg\"]'),
(180, 'LABOUR DISHPASTE 800G\r\n', 6.10, 'Labour Dishpaste 800g has more power to eliminate grease. It removes tough grease and cleans even the difficult dishes, pots, and pans, delivering residue free squeaky clean results.\r\n\r\n', 13, '[\"images/LABOUR DISHPASTE.jpg\"]'),
(181, 'CLOROX BLEACH LIQUID TWINPACK 2x1L\r\n', 13.10, 'Nothing disinfects and cleans better than Clorox Bleach! 100% effective in cleaning stubborn stains, leaving your white cloth like brand-new again. Efficiently kills 99.9% germs, it is suitable for laundry use and household use.\r\n\r\n', 13, '[\"images/CLOROX BLEACH LIQUID TWINPACK.jpg\"]'),
(182, 'FEBREZE FABRIC REFRESHER REFILL 320ML\r\n', 9.10, 'With pleasant floral Ambi Pur scent, Penetrates deep into fabric and eliminates odours as it dries, Removes 99.9% of odour-causing bacteria, Safe for use around children and pets, and Suitable for most fabrics and furniture.', 13, '[\"images/FEBREZE FABRIC REFRESHER REFILL.jpg\"]'),
(183, 'BIO ZIP DETERGENT POWDER 3.8KG', 24.40, 'Bio Zip Detergent Powder has a latest innovation of Co-Enzymes Plus technology that works great in fighting stubborn sweat stains around the collar and sleeves as well as stubborn food stains, leaving your more impactful orange fragrance and gentle on your hands.\r\n\r\n', 13, '[\"images/BIO ZIP DETERGENT POWDER.jpg\"]'),
(184, 'TOP LIQUID DETERGENT 3.6KG\r\n', 26.30, 'Protects fabric colours while cleaning visible and unseen stains that dull them, revealing your clothes vibrancy so they look as good as new.\r\nTOP Micro-Clean Tech is: Anti Sebum - pulls out trapped sweat and body oil.\r\n99.9% Anti Mite-Dust - removes 99.9%* of mite-dust.\r\nAnti Malodour - prevents malodour.\r\n99.9% Anti Bacteria - eliminates 99.9%* of bacteria.', 13, '[\"images/TOP LIQUID DETERGENT.jpg\"]'),
(185, 'ZIP MULTIPURPOSE SCOURING POWDER 750G\r\n', 4.50, 'ZIP Multi-Purpose Scouring Powder actively removes tough stains on various surfaces such as utensils, kitchen tiles, bathrooms andeven drains. The key ingredient \'Sodium Bicarbonate\' has been known to be a useful and effective cleaning and odour eliminating agent. By capitalizing these benefits, ZIP Multi-Purpose Scouring Powder is absolutely the perfect partner for brighter, shinier finish.\r\n\r\n', 13, '[\"images/ZIP MULTIPURPOSE SCOURING POWDER.jpg\"]'),
(186, 'VINDA DELUXE SMOOTH FEEL TOILET ROLLS 16\'R\r\n', 43.90, 'Every sheet of Vinda Deluxe Tissue is made with our signature Knitted Fiber Technology, making it Extra Strong, Extra Soft, Extra Absorbent. Strong even when wet, does not tear and leave bits. Vinda toilet paper sheets are at least 21% larger than other brands. 3-ply premium thickness and quality toilet tissues. Made with 100% virgin wood pulp. Individually wrapped for your hygiene.\r\n\r\n', 13, '[\"images/VINDA DELUXE SMOOTH FEEL TOILET ROLLS.jpg\"]'),
(187, 'SCOTT TOILET TISSUE 180\'Sx20 ROLL\r\n', 29.00, 'To ensure the quality of the tissue, Scott Extra is made with a unique micro-embossed pattern, making sure it\'s soft yet strong, even when it\'s wet.', 13, '[\"images/SCOTT TOILET TISSUE.jpg\"]'),
(188, 'MAGICLEAN STAIN & MOLD REMOVER 400G\r\n', 14.00, 'High density foam penetrates and destroys mold in 5 minutes. The strong penetrative formula removes and wipes out stubborn stains and mold roots. It is suitable for bathroom walls, floor, tile gaps, washing basin, silicone part at shower door, drainage hole, shower curtain and toilet bowl.\r\n\r\n', 13, '[\"images/MAGICLEAN STAIN & MOLD REMOVER.jpg\"]'),
(189, 'MAGICLEAN GREEN APPLE FLOOR CLEANER 2L\r\n', 14.60, 'Has a stronger absorption and is able to remove sticky stains 4X better! It also dries 2X faster and leaves your feet feeling 2X more comfortable with no watermark stains, whilst being able to kill off 99.9% bacteria.\r\n\r\n', 13, '[\"images/MAGICLEAN GREEN APPLE FLOOR CLEANER.jpg\"]'),
(190, 'BOOM POWDER DETERGENT 4KG\r\n', 16.60, 'BOOM Powder Detergent is incorporated with ATOM POWER™ , which serves you with powerful cleaning efficacy that removes stubborn stains effectively. It freshens clothes with pleasant and lasting fragrance.\r\n\r\n', 13, '[\"images/BOOM POWDER DETERGENT.jpg\"]'),
(191, 'AIR WICK SCENTED GEL CONE 180G\r\n', 12.70, 'Air Wick Scented gel contains Natural Essential Oils to deliver an authentic and fresh experience to your home with nature-inspired fragrances. It neutralizes odors and provides up to 30 days of continuous freshness and suitable using in car, bedroom, toilet & living room\r\n\r\n', 13, '[\"images/AIR WICK SCENTED GEL CONE.jpg\"]'),
(192, 'CUTIE COMPACT TOILET ROLL 10\'S\r\n\r\n', 23.30, '', 13, '[\"images/CUTIE COMPACT TOILET ROLL.jpg\"]'),
(193, 'PEDIGREE HOME STYLE 1.15KG', 14.30, 'Pedigree Home Style Chicken - produced from quality meat and selected vegetables. It is enriched with Vitamin E and Omega 6 for a healthy skin and a beautiful coat\r\n\r\nPedigree Home Style Beef - made from real meat. Produced from quality meat and selected vegetables which is carefully cooked to preserve the essential nutrient \r\n\r\nPedigree Home Style Beef & Vegetable - designed to protect your dog in four ways; support their natural defences, a healthy skin and coat, good digestion and healthy teeth. ', 19, '[\"images/PEDIGREE HOME STYLE.jpg\"]'),
(194, 'MULTIPLY KITCHEN TOWEL 120´S\r\n', 9.10, 'The Benefits of MultiPly Kitchen Towel:\r\nPrevent spreading of unwanted bacterial.\r\nNo longer worrying about washing dirty table clothes. Thicker and more absorbent.\r\nMulti-Purpose usage for both household and restaurants and finally Disposable convenience.', 14, '[\"images/MULTIPLY KITCHEN TOWEL.jpg\"]'),
(195, 'SCOTT CALORIE ABSORB PREMIUM TOWEL 6 ROLLS', 20.60, 'A kitchen towel that is convenient to use for food preparation and disposable. It is also effective in absorbing excess oil from fried food and cleaning up grease in the kitchen.\r\n\r\n', 14, '[\"images/SCOTT CALORIE ABSORB PREMIUM TOWEL.jpg\"]'),
(196, 'ENERGIZER MAX PLUS AA 2\'S', 13.10, 'HIGH PERFORMANCE ENERGY FOR YOUR HIGH-TECH DEVICES\r\nIntroducing, our new line of performance alkaline batteries! Max Plus™ is our Longest Lasting Alkaline AA & AAA Batteries that provide powerful performance for your devices!', 14, '[\"images/ENERGIZER MAX PLUS AA 2\'S.jpg\"]'),
(197, 'ENERGIZER MINI AL A27 BP1', 6.50, 'Our A27 battery provides dependable power for keyless entry and garage door openers.\r\nCell size is A27 with type Miniature Alkaline. As for the replacement: 27A, A27BP, G27A, GP27A, L828, MN27.', 14, '[\"images/ENERGIZER MINI AL A27 BP1.jpg\"]'),
(198, 'NESTLE CERELAC RICE NO ADDED SUGAR 200G\r\n', 11.40, 'When your child turns 6 months old, it\'s time to introduce solid food for the very first time. Start with single grains that are easily digestible. CERELAC? Infant Cereal Rice variant is one of the best start to a world of complementary food feeding.', 15, '[\"images/NESTLE CERELAC RICE NO ADDED SUGAR 200G.jpg\"]'),
(199, 'JOHNSON BABY BEDTIME LOTION 200ML', 16.80, 'Johnson\'s Bedtime™ baby lotion moisturizes skin for 24 hours and is made with NATURALCALMTM aromas that help soothe and relax baby before bed. It also can be used n the evening as part of our clinically proven Bedtime® routine of warm bath, gentle massage, and quiet time to help your child get a peaceful night\'s sleep*. When baby sleeps, parents sleep.\r\n\r\n', 15, '[\"images/JOHNSON BABY BEDTIME LOTION 200ML.jpg\"]'),
(200, 'NESTLE CERELAC CEREAL 350G', 18.30, 'Nestle Cerelac Cereal is suitable for baby at age of 6 months. It contains Vitamins A, C, B1, Iodine and DHA, which are the key nutrients for baby\'s growth and development.\r\n\r\n', 15, '[\"images/NESTLE CERELAC CEREAL.jpg\"]'),
(201, 'JOHNSONS PH5.5 NOURISHING BODY WASH 500ML', 12.70, 'Nourishing Body Wash is formulated with honey. It conditions your skin as you cleanses, leaving it feeling soft, smooth and moisturized. Carefully formulated to respect your skin\'s natural pH level to optimize your skin\'s natural moisture balance.\r\n\r\n', 15, '[\"images/JOHNSONS PH5.5 NOURISHING BODY WASH.jpg\"]'),
(202, 'BUDWEISER BEER BOTTLE 330ML\r\n', 14.00, 'Budweiser Beer 330ml known as \'The King of Beers\' is a medium -bodied , flavorful, crisp American- style lager. It is brewed with the best barley malt and a blend of premium hop varieties\r\n', 18, '[\"images/BUDWEISER BEER BOTTLE.jpg\"]'),
(203, 'ANCHOR SMOOTH PILSENER BEER 640ML\r\n', 17.50, 'A popular brew with a smooth, refreshing taste. Anchor Smooth was awarded Gold at the Monde Selection for 3 consecutive years from 2010 to 2012. Anchor Smooth Draught is a refreshing lager with a smooth blend of aromatic hops, brewed perfectly into each bottle.', 18, '[\"images/ANCHOR SMOOTH PILSENER BEER.jpg\"]'),
(204, 'TIGER PLATINUM BEER 320ML\r\n', 8.30, 'A bold lager, born and brewed in the heart of Asia through our tropical lagering process. Tiger\'s uniquely refreshing and full-bodied flavour is enjoyed in more than 70 countries, with over 40 brewing quality awards under its belt.\r\n\r\n', 18, '[\"images/TIGER PLATINUM BEER.jpg\"]'),
(205, 'MORNING KISS DORAEMON KIDS TOOTHPASTE 40G\r\n', 4.50, 'Morning Kiss Doraemon Kids Toothpaste is specially designed handles for small hands. It is super soft, rounded and gentle filaments to help protect young enamel and gums. ', 16, '[\"images/MORNING KISS DORAEMON KIDS TOOTHPASTE.jpg\"]'),
(206, 'MAY SOAP 255G', 5.50, 'Discover the luxurious May Soap collection: Diamond Dazzle gently purifies with sea salt for soft, luminous skin; Rose Pleasure nourishes and revitalizes; Lavender Calm soothes and balances with French lavender oil; White Radiance protects with white tea essence and silk protein for fair, nourished skin; and Milk Luxury combines pure pearl essence and rice milk to revive and deeply nourish your skin all day long.', 16, '[\"images/MAY SOAP.jpg\"]'),
(207, 'PURE DEEP CLEANSE WIPES 25\'S\r\n', 4.60, 'Pure Deep Cleanse Wipes help to unblock pores and get rid of cosmetics and undesirable oils while protecting skin against blackheads and other impurities. These deep cleaning Paraben Free cleans contain Zinc, Vitamin B3 and Witch Hazel.', 16, '[\"images/PURE DEEP CLEANSE WIPES.jpg\"]'),
(208, 'LIBRESSE LONG & WIDE SLIM PANTY LINER 3x30\'S', 22.80, 'Libresse Longer & Wider Slim liners are longer in length, offering wider coverage and protection and is ideal for pre and post period or heavy discharge. Comes with a breathable soft cottony surface keeping you dry, everyday. CurveFit, Extra Long, Cottony Softness, and Breathable.\r\n\r\n\r\n', 16, '[\"images/LIBRESSE LONG & WIDE SLIM PANTY LINER.jpg\"]'),
(209, 'WHISPER COTTON THICKS OVERNIGHT WING 16\'S', 9.50, 'Whisper Cottony Soft Protection Regular provides up to 12 hours of leakage protection with Dermacare™ lotion for skin comfort, featuring individually wrapped, hygienic pads with a warm Magic Cushion to prevent leaks, a secure sticky design to keep the pad in place, and anti-leak barriers for all-angle protection.\r\n', 16, '[\"images/WHISPER COTTON THICKS OVERNIGHT WING.jpg\"]'),
(210, 'INTIMATE DAY SLIM WING 8\'S', 3.90, 'Total Cottony Comfort-Dry Absorbs the secretion perfectly & retains it securely inside Soft Contour Soft, gently raised center to fit your body naturally. \r\n\r\nUltra ADL Traps and channels fluid downward to prevent fluid from resurfacing Cottony surface Total cottony comfort-dry With mini holes Super soft edge', 16, '[\"images/INTIMATE DAY SLIM WING.jpg\"]'),
(211, 'ORAL-B COMPLETE EASY CLEAN MEDIUM TOOTHBRUSH 5\'S', 16.20, 'Oral-B Complete Clean & Sensitive Manual toothbrush has a combination of normal and super thin bristles that help deliver a thorough yet gentle clean. Super thin bristles reach 3x deeper than ordinary bristles and are designed to be tough on plaque but soft on gums. Try with Oral B Pro Expert Toothpaste for healthier and stronger teeth. \r\n\r\nOral-B Complete Clean & Senstive Manual toothbrush gently cleans between teeth and below the gum line, Combination of normal and super thin bristles designed to be tough on plaque but soft on gums, Super thin bristles reach 3x deeper than ordinary bristles, Tongue cleaner helps freshen breath The Oral-B Complete toothbrush features a brush head specially designed to give you an all-around clean and improve gum health by reducing gingivitis whilst remaining gentle on sensitive teeth and gums. Reaches between teeth to remove plaque. Helps freshen breath. Massages the gums.', 16, '[\"images/ORAL-B COMPLETE EASY CLEAN MEDIUM TOOTHBRUSH.jpg\"]'),
(212, 'COLGATE TRIPLE ACTION 200G\r\n', 13.70, 'Colgate Triple Action Original Mint Toothpaste protects against cavities, whitens teeth, and freshens breath. Use this refreshing toothpaste for proven cavity protection for your whole family. ', 16, '[\"images/COLGATE TRIPLE ACTION.jpg\"]'),
(213, 'COLGATE TRIPLE ACTION TWINPACK 2x175G', 22.90, 'Experience three-way protection with cavity protection, whiter teeth, and fresh breath, thanks to fluoride that strengthens teeth against decay, gentle cleaning crystals that remove surface stains, and a formula that freshens your whole mouth.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 16, '[\"images/COLGATE TRIPLE ACTION TWINPACK.jpg\"]'),
(214, 'KODOMO CHILDREN APPLE TOOTHPASTE 80G', 6.30, 'Designed by children\'s oral care specialists, this toothpaste combines 5% Xylitol and Active Fluoride to restore minerals and repair early caries in just 14 days. Safe for daily use, sugar-free, and with less foam to encourage longer brushing, it’s the perfect choice for your child’s healthy smile.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 16, '[\"images/KODOMO CHILDREN APPLE TOOTHPASTE.jpg\"]'),
(215, 'DARLIE TOOTHBRUSH CHARCOAL GOLD BUY 2 FREE 1', 21.40, 'The Charcoal Gold Toothbrush is your go-to solution for thorough inner molar cleaning, featuring a dual-ring compact head for deep cleansing and plaque prevention, 0.01mm soft tapered bristles that reduce bacterial growth on bristles by 99%, and a uniquely designed anti-slip handle for a comfortable, secure grip.', 16, '[\"images/DARLIE TOOTHBRUSH CHARCOAL GOLD.jpg\"]'),
(216, 'COLGATE TWISTER SOFT TOOTHBRUSH BUY 2 FREE 1', 12.30, 'The toothbrush features a unique Twister Bristle Pattern for effective cleaning between teeth and along the gum line, multi-height bristles to fit the contours of your teeth for thorough surface cleaning, and a Twister Tongue Cleaner for complete oral care.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 16, '[\"images/COLGATE TWISTER SOFT TOOTHBRUSH.jpg\"]'),
(217, 'BIOSILK MAXI DAY NO WING 30\'S', 14.80, 'Experience the benefits of Pure Natural Herbs Lining for hygiene care, offering natural anti-bacterial protection to reduce itchiness, redness, infections, and abnormal discharges. It minimizes menstrual pain, reduces the risk of urinary infections and genital itchiness, regulates the menstrual cycle, improves blood circulation, and provides a cooling, refreshing feel without any peculiar blood smell.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 16, '[\"images/BIOSILK MAXI DAY NO WING.jpg\"]'),
(218, 'LIBRESSE G4 NIGHT WING 3x12\'S', 22.80, 'Suitable for Maxi Fit during heavy flow days. Libresse® pads with SecureFit™ and DFC works together to deliver all round fit and better absorption as it is uniquely designed based on womens\' curves to keep your pad securely in place. Plus, it\'s made with 100% virgin pulp!\r\n\r\n', 16, '[\"images/LIBRESSE G4 NIGHT WING.jpg\"]'),
(219, 'LIBRESSE G4 SLIM WING 3x12\'S', 22.80, 'Libresse® pads, designed with patented SecureFit™ technology, perfectly adapt to women’s curves with a wider front for a secure fit, a narrower middle for comfort between the thighs, and split rear ends for a close fit to the buttocks. Featuring Deep Flow Channels, these pads quickly absorb and channel fluids for superior dryness, keeping wetness away from the skin.', 16, '[\"images/LIBRESSE G4 SLIM WING.jpg\"]'),
(220, 'LIBRESSE G4 WIDER BACK NIGHT 3x10\'S', 22.80, 'Libresse® pads are perfect for light flow days, offering a Long & Wide Fit with SecureFit™ technology and Deep Flow Channels (DFC) to ensure a secure, curve-adapted fit, superior absorption, and all-around protection. Designed with a wider back and wings, these pads stay comfortably in place for better coverage and confidence.', 16, '[\"images/LIBRESSE G4 WIDER BACK NIGHT.jpg\"]'),
(221, 'Q-THREE CHAOSANSI 198G\r\n', 7.90, 'Q-Three Chaosansi is contains a crunchy and spicy mix of shredded pork shredded shitake mushrooms and shredded bamboo shoots.\r\n\r\n', 17, '[\"images/Q-THREE CHAOSANSI.jpg\"]'),
(222, 'PREMIUM GOLD COIN DRIED MEAT 200G', 15.40, 'Premium Gold Coin Pork Jerky is one of the most selling type of Chinese savory sweet jerky that traditionally takes the form of thin round slices. \r\n\r\n', 17, '[\"images/PREMIUM GOLD COIN DRIED MEAT.jpg\"]'),
(223, 'HAI DI LAO BEAN CURD ROLL 120G\r\n', 11.50, 'Ring Roll is best eaten with soup based dishes — simply dip in soup for 3 seconds and it\'s done! Enjoy the soup base with the crispiness of Ring Roll; it can also be eaten with hot pot or ramen.', 17, '[\"images/HAI DI LAO BEAN CURD ROLL.jpg\"]');

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
  `category` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipeID`, `productID`, `category`, `title`, `description`, `image`) VALUES
(1, 1, 'CCK product', 'Baked Parmesan Cheese Corn', '-CCK SWEET CORN\r\n\r\nIngredients：\r\n1/2 cup mayonnaise\r\n1/2 teaspoon ground black pepper\r\n1/2 teaspoon garlic salt\r\n2 teaspoons sugar\r\n1 tablespoon grated parmesan cheese\r\n1/2 cup shredded parmesan cheese, divided\r\nParsley flakes, for garnish\r\n\r\nInstructions：\r\nStep1: Preheat the oven to 380°F (198°C). In a large bowl, combine 2 cans of sweet corn, mayonnaise, ground black pepper, garlic salt, sugar, grated Parmesan cheese, and half of the shredded Parmesan cheese. Stir well with a spatula.\r\n\r\nStep 2: Pour the mixture into a baking dish and sprinkle the remaining shredded Parmesan cheese on top.\r\n\r\nStep 3: Bake for 20 to 30 minutes, or until the cheese is melted and bubbly.\r\n\r\nStep 4: Remove from the oven and serve immediately, garnished with additional shredded Parmesan cheese and parsley flakes, if desired.\r\n\r\nNotes:\r\n-To make this dish creamer, you may substitute one can of sweet whole-kernel corn with cream-style corn to add richness.\r\n\r\n-Add a cheesy topping to the dish with more kinds of cheese. You may broil the dish for an extra 5 minutes with a cup of mozzarella cheese evenly sprinkled on top. Let the cheese melt and drizzle down.\r\n\r\n-Give the dish a spicy kick with some paprika sprinkled on top before serving.', '[\"recipe_image/Baked Parmesan Cheese Corn_1.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_2.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_3.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_4.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_5.jpg\"]'),
(2, 3, 'CCK product', 'Fried Popiah', '-CCK MINCED BEEF\r\n\r\nIngredients:\r\n1 pack spring roll wrappers\r\n3 tablespoons cooking oil\r\n2 cloves garlic, chopped finely\r\n150 g (5 oz) baby shrimp, chopped finely\r\n5-6 dried shitake mushrooms, soaked and chopped finely\r\n200 g (7 oz) yam bean, sliced\r\n100 g (3½ oz) carrot, sliced\r\n\r\nSeasonings:\r\n1 teaspoon chicken stock granules\r\n1/2 teaspoon salt\r\n1 dash pepper\r\n1 cup water\r\n1 teaspoon oyster sauce\r\n1 tablespoon cornstarch, mix with water\r\n\r\nlour Mixture:\r\n2 tablespoons plain flour\r\n4 tablespoons water\r\n\r\nInstructions:\r\nStep 1: In a wok, heat the cooking oil. Add the garlic and stir-fry until aromatic. Then, add the CCK MINCED BEEF, shrimp, and mushrooms, and continue to stir-fry until cooked.\r\n\r\nStep 2：Add the yam bean and carrot, and stir-fry for 1-2 minutes. Then, add 1 cup of water, cover with a lid, and simmer for 15-20 minutes until the vegetables are tender. Add the seasoning ingredients and mix well. Dish out and set aside.\r\n\r\nStep 3: Place a piece of spring roll wrapper on a flat surface. Add 2 spoonfuls of filling to the center of the wrapper, then fold in the two sides and roll it up. Use the flour mixture to seal the edges.\r\n\r\nStep 4: Heat a wok and pour in 2 cups of cooking oil. Deep fry the spring rolls over medium heat until golden brown and crispy. Remove them and drain on paper towels. Serve hot with chili sauce.\r\n\r\nNotes:\r\n-When you’re adding the filling to the wrappers, keep it simple—don’t overstuff! When you’re adding the filling to the wrappers, keep it simple—don’t overstuff! Two spoonfuls is just right; otherwise, it gets messy.\r\n\r\n-Keep an eye on your oil temperature at around 350°F (175°C) while frying. If it’s too hot, the outside will burn before the inside cooks, and if it’s too cool, your popiah will soak up too much oil and get greasy.\r\n\r\n-Don’t overcrowd the pan! Frying in small batches helps everything cook evenly and stay nice and crispy.', '[\"recipe_image/popiah_1.jpg\",\"recipe_image/popiah_2.webp\",\"recipe_image/popiah_3.webp\",\"recipe_image/popiah_4.webp\",\"recipe_image/popiah_5.webp\"]'),
(3, 11, 'CCK product', 'Ginger Scallion Fish', '-CCK BREADED POLLOCK FILLET\r\n\r\nIngredients:\r\n1 1/2 tablespoons oil\r\n2- inch ginger, skin peeled and cut into thin slices\r\n2 stalks scallion, cut into 2-inch lengths (5 cm)\r\n\r\nMarinade:\r\n1 teaspoon cornstarch\r\n1 teaspoon Shaoxing wine\r\n\r\nSauce:\r\n1/2 tablespoon soy sauce\r\n1/2 tablespoon oyster sauce\r\n1/2 teaspoon cornstarch\r\n1 teaspoon sugar\r\n1/4 teaspoon sesame oil\r\n3-4 tablespoons water\r\nSalt to taste\r\n3 dashes white pepper powder\r\n\r\nInstructions:\r\nStep 1: Marinate the fish for about 10 minutes. Mix the sauce ingredients in a small bowl and set aside.\r\n\r\nStep 2: Heat up the wok with cooking oil. Add ginger slices to the wok when the oil is very hot. Stir-fry the ginger until aromatic, then add the fish fillet. Stir-fry the fish until it is half cooked.\r\n\r\nStep 3: Add the sauce and continue to stir-fry until the fish is cooked through. If the sauce dries out, add a little water. Add the chopped scallions and stir briefly. Dish out and serve hot.\r\n\r\nNotes:\r\n-Using fresh ginger and scallions will enhance the flavor of the dish. Avoid using old or wilted ingredients.\r\n\r\n-Opt for firm-fleshed fish fillets like Basa, tilapia, or cod that can withstand stir-frying without falling apart.\r\n\r\n-Make sure your wok or pan is hot enough before adding ingredients. This helps to quickly stir-fry and sear the fish without overcooking.\r\n\r\n-If the sauce becomes too thick or dries out during cooking, add a splash of water to adjust the consistency.', '[\"recipe_image/Ginger Scallion Fish_1.jpg\",\"recipe_image/Ginger Scallion Fish_2.jpg\",\"recipe_image/Ginger Scallion Fish_3.webp\",\"recipe_image/Ginger Scallion Fish_4.webp\",\"recipe_image/Ginger Scallion Fish_5.webp\"]'),
(4, 6, 'CCK product', 'Spam Fried Rice', '-CCK MIX VEGETABLES 900G\r\n\r\nIngredients：\r\n3 cups overnight steamed rice\r\n2 1/2 tablespoons oil\r\n3 large eggs, lightly beaten\r\n2 cloves garlic, minced\r\n6 oz (170g) spam, cut into small cubes\r\n1 cup frozen mixed vegetables, thaw and defrost\r\nsalt, to taste\r\n\r\nSeasonings:\r\n1 1/2 tablespoons soy sauce\r\n1/2 tablespoon fish sauce\r\n1/2 teaspoon sesame oil\r\n3 dashes ground white pepper\r\n\r\nInstructions：\r\n\r\nStep 1: Break up the lumpy overnight rice using the back of a spoon, a fork, or your hand. In a small bowl, mix all the ingredients for the Seasonings.\r\n\r\nStep 2: Heat 1/2 tablespoon of the oil in a wok over high heat and cook the eggs, breaking them into small pieces with a spatula. Set aside. Reheat the wok with the remaining 2 tablespoons of oil and stir-fry the garlic until aromatic.\r\n\r\nStep 3: Add the spam pieces and stir-fry until they are light brown, then add the mixed vegetables. Stir to combine well.\r\n\r\nStep 4: Add the rice to the wok and use the spatula to stir-fry continuously until all the ingredients are well blended. Add the seasonings, mixing thoroughly with the rice and other ingredients. Return the cooked eggs to the wok and combine with the rice. Dish out and serve immediately.', '[\"recipe_image/Spam Fried Rice_ (1).jpg\",\"recipe_image/Spam Fried Rice_ (1).png\",\"recipe_image/Spam Fried Rice_ (2).jpg\",\"recipe_image/Spam Fried Rice_ (3).jpg\",\"recipe_image/Spam Fried Rice_5.webp\"]'),
(5, 12, 'CCK product', 'Teriyaki Beef Meatballs', '-CCK PREMIO BEEF BALL 500G\r\n\r\nIngredients:\r\noil, for shallow frying\r\n1/3 cup Japanese mirin, sweet rice wine\r\n2 tablespoons soy sauce\r\n1 tablespoon sugar\r\nwhite sesame, optional\r\nscallion , or cilantro, chopped, optional\r\n\r\nInstructions:\r\nStep 1:Heat a pan or skillet with some oil and shallow-fry the meatballs until they are lightly browned and cooked through.\r\n\r\nStep 2: Remove the excess oil from the pan or skillet. Lower the heat to medium-low and add the Japanese mirin, soy sauce, and sugar. Stir well with the chicken meatballs. Simmer and cook until the sauce slightly thickens, about 5 minutes.\r\n\r\nStep 3: Top with sesame seeds and chopped scallions or cilantro, if desired. Dish out and serve immediately.', '[\"recipe_image/Teriyaki Chicken Meatballs_ (1).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (2).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (3).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (4).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (5).jpg\"]');


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `memberID` varchar(32) NOT NULL,
  `phoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`memberID`, `phoneNumber`) VALUES
('1111111111', 1111111111),
('1111111113', 1111111113);

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
  MODIFY `existsmemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `gameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
