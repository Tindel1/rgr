-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3308
-- Время создания: Фев 16 2017 г., 09:30
-- Версия сервера: 5.5.50
-- Версия PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cmaster`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ID_client` int(11) NOT NULL,
  `last_name_client` text NOT NULL,
  `first_name_client` text NOT NULL,
  `patronimic_name_client` text NOT NULL,
  `mobile_number` bigint(255) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`ID_client`, `last_name_client`, `first_name_client`, `patronimic_name_client`, `mobile_number`, `address`) VALUES
(1, 'Столов', 'Иван', 'Артемович', 85436788349, 'Ленина 123-12'),
(2, 'Иванов', 'Евгений', 'Петрович', 85436788764, 'Ленина 23-39'),
(3, 'Сидоров', 'Артем', 'Викторович', 85436788123, 'Титова 512-32'),
(4, 'Ковров', 'Виталий', 'Витальевич', 85216788349, 'Рогачева 52-61'),
(6, 'Николаев', 'Максим', 'Максимович', 81236788349, 'Орджоникидзе  67-12'),
(7, 'Васильевффф', 'Сергей', 'Николаевич', 85432688349, 'Морская 52-21'),
(8, 'Иванов', 'Иван', 'Иванович', 89514733821, 'Пушкина 92-12');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `ID_order` int(11) NOT NULL,
  `ID_client` int(11) NOT NULL,
  `ID_service` int(11) NOT NULL,
  `status_order` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`ID_order`, `ID_client`, `ID_service`, `status_order`) VALUES
(1, 1, 1, 1),
(2, 2, 4, 0),
(3, 3, 4, 0),
(5, 1, 2, 1),
(6, 4, 2, 0),
(7, 6, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `ID_service` int(11) NOT NULL,
  `name_service` text NOT NULL,
  `price_service` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`ID_service`, `name_service`, `price_service`) VALUES
(1, 'Замена комплектующих', 1000),
(2, 'Диагностика аппаратных проблем', 500),
(4, 'Восстановление случайно удалёных файлов', 900),
(5, 'Подключение периферийных устройствМФУ', 400),
(6, 'Переустановка / установка ОС Windows', 1100),
(7, 'Установка драйверов устройств и программ', 750),
(8, 'настройка Wi-Fi роутеров', 450);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_client`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID_order`),
  ADD KEY `ID_client` (`ID_client`),
  ADD KEY `ID_goods` (`ID_service`);

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ID_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `ID_client` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `ID_order` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `service`
--
ALTER TABLE `service`
  MODIFY `ID_service` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `client` (`ID_client`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`ID_service`) REFERENCES `service` (`ID_service`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
