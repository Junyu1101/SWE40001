-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-11 20:05:22
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `cck_websystem`
--

-- --------------------------------------------------------

--
-- 表的结构 `recipe`
--

CREATE TABLE `recipe` (
  `recipeID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `recipe`
--

INSERT INTO `recipe` (`recipeID`, `productID`, `title`, `description`, `image`) VALUES
(1, 1, 'Baked Parmesan Cheese Corn', '-CCK SWEET CORN\r\n\r\nIngredients：\r\n1/2 cup mayonnaise\r\n1/2 teaspoon ground black pepper\r\n1/2 teaspoon garlic salt\r\n2 teaspoons sugar\r\n1 tablespoon grated parmesan cheese\r\n1/2 cup shredded parmesan cheese, divided\r\nParsley flakes, for garnish\r\n\r\nInstructions：\r\nStep1: Preheat the oven to 380°F (198°C). In a large bowl, combine 2 cans of sweet corn, mayonnaise, ground black pepper, garlic salt, sugar, grated Parmesan cheese, and half of the shredded Parmesan cheese. Stir well with a spatula.\r\n\r\nStep 2: Pour the mixture into a baking dish and sprinkle the remaining shredded Parmesan cheese on top.\r\n\r\nStep 3: Bake for 20 to 30 minutes, or until the cheese is melted and bubbly.\r\n\r\nStep 4: Remove from the oven and serve immediately, garnished with additional shredded Parmesan cheese and parsley flakes, if desired.\r\n\r\nNotes:\r\n-To make this dish creamer, you may substitute one can of sweet whole-kernel corn with cream-style corn to add richness.\r\n\r\n-Add a cheesy topping to the dish with more kinds of cheese. You may broil the dish for an extra 5 minutes with a cup of mozzarella cheese evenly sprinkled on top. Let the cheese melt and drizzle down.\r\n\r\n-Give the dish a spicy kick with some paprika sprinkled on top before serving.', '[\"recipe_image/Baked Parmesan Cheese Corn_1.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_2.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_3.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_4.jpg\",\"recipe_image/Baked Parmesan Cheese Corn_5.jpg\"]'),
(2, 3, 'Fried Popiah', '-CCK MINCED BEEF\r\n\r\nIngredients:\r\n1 pack spring roll wrappers\r\n3 tablespoons cooking oil\r\n2 cloves garlic, chopped finely\r\n150 g (5 oz) baby shrimp, chopped finely\r\n5-6 dried shitake mushrooms, soaked and chopped finely\r\n200 g (7 oz) yam bean, sliced\r\n100 g (3½ oz) carrot, sliced\r\n\r\nSeasonings:\r\n1 teaspoon chicken stock granules\r\n1/2 teaspoon salt\r\n1 dash pepper\r\n1 cup water\r\n1 teaspoon oyster sauce\r\n1 tablespoon cornstarch, mix with water\r\n\r\nlour Mixture:\r\n2 tablespoons plain flour\r\n4 tablespoons water\r\n\r\nInstructions:\r\nStep 1: In a wok, heat the cooking oil. Add the garlic and stir-fry until aromatic. Then, add the CCK MINCED BEEF, shrimp, and mushrooms, and continue to stir-fry until cooked.\r\n\r\nStep 2：Add the yam bean and carrot, and stir-fry for 1-2 minutes. Then, add 1 cup of water, cover with a lid, and simmer for 15-20 minutes until the vegetables are tender. Add the seasoning ingredients and mix well. Dish out and set aside.\r\n\r\nStep 3: Place a piece of spring roll wrapper on a flat surface. Add 2 spoonfuls of filling to the center of the wrapper, then fold in the two sides and roll it up. Use the flour mixture to seal the edges.\r\n\r\nStep 4: Heat a wok and pour in 2 cups of cooking oil. Deep fry the spring rolls over medium heat until golden brown and crispy. Remove them and drain on paper towels. Serve hot with chili sauce.\r\n\r\nNotes:\r\n-When you’re adding the filling to the wrappers, keep it simple—don’t overstuff! When you’re adding the filling to the wrappers, keep it simple—don’t overstuff! Two spoonfuls is just right; otherwise, it gets messy.\r\n\r\n-Keep an eye on your oil temperature at around 350°F (175°C) while frying. If it’s too hot, the outside will burn before the inside cooks, and if it’s too cool, your popiah will soak up too much oil and get greasy.\r\n\r\n-Don’t overcrowd the pan! Frying in small batches helps everything cook evenly and stay nice and crispy.', '[\"recipe_image/popiah_1.jpg\",\"recipe_image/popiah_2.webp\",\"recipe_image/popiah_3.webp\",\"recipe_image/popiah_4.webp\",\"recipe_image/popiah_5.webp\"]'),
(3, 11, 'Ginger Scallion Fish', '-CCK BREADED POLLOCK FILLET\r\n\r\nIngredients:\r\n1 1/2 tablespoons oil\r\n2- inch ginger, skin peeled and cut into thin slices\r\n2 stalks scallion, cut into 2-inch lengths (5 cm)\r\n\r\nMarinade:\r\n1 teaspoon cornstarch\r\n1 teaspoon Shaoxing wine\r\n\r\nSauce:\r\n1/2 tablespoon soy sauce\r\n1/2 tablespoon oyster sauce\r\n1/2 teaspoon cornstarch\r\n1 teaspoon sugar\r\n1/4 teaspoon sesame oil\r\n3-4 tablespoons water\r\nSalt to taste\r\n3 dashes white pepper powder\r\n\r\nInstructions:\r\nStep 1: Marinate the fish for about 10 minutes. Mix the sauce ingredients in a small bowl and set aside.\r\n\r\nStep 2: Heat up the wok with cooking oil. Add ginger slices to the wok when the oil is very hot. Stir-fry the ginger until aromatic, then add the fish fillet. Stir-fry the fish until it is half cooked.\r\n\r\nStep 3: Add the sauce and continue to stir-fry until the fish is cooked through. If the sauce dries out, add a little water. Add the chopped scallions and stir briefly. Dish out and serve hot.\r\n\r\nNotes:\r\n-Using fresh ginger and scallions will enhance the flavor of the dish. Avoid using old or wilted ingredients.\r\n\r\n-Opt for firm-fleshed fish fillets like Basa, tilapia, or cod that can withstand stir-frying without falling apart.\r\n\r\n-Make sure your wok or pan is hot enough before adding ingredients. This helps to quickly stir-fry and sear the fish without overcooking.\r\n\r\n-If the sauce becomes too thick or dries out during cooking, add a splash of water to adjust the consistency.', '[\"recipe_image/Ginger Scallion Fish_1.jpg\",\"recipe_image/Ginger Scallion Fish_2.jpg\",\"recipe_image/Ginger Scallion Fish_3.webp\",\"recipe_image/Ginger Scallion Fish_4.webp\",\"recipe_image/Ginger Scallion Fish_5.webp\"]'),
(4, 6, 'Spam Fried Rice', '-CCK MIX VEGETABLES 900G\r\n\r\nIngredients：\r\n3 cups overnight steamed rice\r\n2 1/2 tablespoons oil\r\n3 large eggs, lightly beaten\r\n2 cloves garlic, minced\r\n6 oz (170g) spam, cut into small cubes\r\n1 cup frozen mixed vegetables, thaw and defrost\r\nsalt, to taste\r\n\r\nSeasonings:\r\n1 1/2 tablespoons soy sauce\r\n1/2 tablespoon fish sauce\r\n1/2 teaspoon sesame oil\r\n3 dashes ground white pepper\r\n\r\nInstructions：\r\n\r\nStep 1: Break up the lumpy overnight rice using the back of a spoon, a fork, or your hand. In a small bowl, mix all the ingredients for the Seasonings.\r\n\r\nStep 2: Heat 1/2 tablespoon of the oil in a wok over high heat and cook the eggs, breaking them into small pieces with a spatula. Set aside. Reheat the wok with the remaining 2 tablespoons of oil and stir-fry the garlic until aromatic.\r\n\r\nStep 3: Add the spam pieces and stir-fry until they are light brown, then add the mixed vegetables. Stir to combine well.\r\n\r\nStep 4: Add the rice to the wok and use the spatula to stir-fry continuously until all the ingredients are well blended. Add the seasonings, mixing thoroughly with the rice and other ingredients. Return the cooked eggs to the wok and combine with the rice. Dish out and serve immediately.', '[\"recipe_image/Spam Fried Rice_ (1).jpg\",\"recipe_image/Spam Fried Rice_ (1).png\",\"recipe_image/Spam Fried Rice_ (2).jpg\",\"recipe_image/Spam Fried Rice_ (3).jpg\",\"recipe_image/Spam Fried Rice_5.webp\"]'),
(5, 12, 'Teriyaki Beef Meatballs', '-CCK PREMIO BEEF BALL 500G\r\n\r\nIngredients:\r\noil, for shallow frying\r\n1/3 cup Japanese mirin, sweet rice wine\r\n2 tablespoons soy sauce\r\n1 tablespoon sugar\r\nwhite sesame, optional\r\nscallion , or cilantro, chopped, optional\r\n\r\nInstructions:\r\nStep 1:Heat a pan or skillet with some oil and shallow-fry the meatballs until they are lightly browned and cooked through.\r\n\r\nStep 2: Remove the excess oil from the pan or skillet. Lower the heat to medium-low and add the Japanese mirin, soy sauce, and sugar. Stir well with the chicken meatballs. Simmer and cook until the sauce slightly thickens, about 5 minutes.\r\n\r\nStep 3: Top with sesame seeds and chopped scallions or cilantro, if desired. Dish out and serve immediately.', '[\"recipe_image/Teriyaki Chicken Meatballs_ (1).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (2).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (3).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (4).jpg\",\"recipe_image/Teriyaki Chicken Meatballs_ (5).jpg\"]');

--
-- 转储表的索引
--

--
-- 表的索引 `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipeID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
