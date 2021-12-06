-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2021 a las 21:24:27
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_libros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `nacimiento` date NOT NULL,
  `muerte` date NOT NULL,
  `nacionalidad` varchar(40) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `nombre`, `nacimiento`, `muerte`, `nacionalidad`, `imagen`) VALUES
(1, 'Stephen Edwing King', '1947-09-21', '0000-00-00', 'Estadounidense', 'img/author/ 619d85e1e5854.jpg'),
(2, 'J K Rowling', '1965-07-31', '0000-00-00', 'Britanica', ''),
(3, 'Gabriel García Marquez', '1927-03-06', '2014-04-17', 'Colombiano', ''),
(4, 'Ernesto Sábato', '1911-06-24', '2011-04-30', 'Argentino', ''),
(5, 'Florencia Bonelli', '1971-05-05', '0000-00-00', 'Argentina', ''),
(6, 'George R R Martin', '1948-09-20', '0000-00-00', 'Estadounidense', ''),
(7, 'Edgar Allan Poe', '1809-01-19', '1849-10-07', 'Estadounidense', ''),
(8, 'J R R Tolkien', '1892-01-03', '1973-09-02', 'Britanico', ''),
(9, 'Stieg Larsson', '1954-08-15', '2004-11-09', 'Sueco', ''),
(10, 'Paulo Coelho', '1947-08-24', '0000-00-00', 'Brasileño', ''),
(11, 'Dan Brown', '1964-06-22', '0000-00-00', 'Estadounidense', ''),
(13, 'Patrick Suskind', '1949-03-26', '0000-00-00', 'Aleman', ''),
(14, 'Oscar Wilde', '1854-10-16', '1900-11-30', 'Irlandes', 'img/author/ 619d848dd5f4bjpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `puntuacion` tinyint(5) NOT NULL,
  `usuario` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentario`, `puntuacion`, `usuario`, `id_libro`) VALUES
(1, 'Muy bueno el libro', 4, 2, 20),
(2, 'Me resulto muy interesante pero es extenso', 3, 2, 33),
(5, 'No me gusto el libro, me resulto muy pesado y largo', 1, 2, 3),
(6, 'Interesante libro', 1, 2, 3),
(7, 'Muy buen libro, interesante y facil de leer', 4, 2, 5),
(8, 'Muy buen libro, interesante y tiene buenos personajes', 5, 2, 6),
(9, 'Me resulto aburrido y pesado de leer.', 1, 2, 19),
(10, 'muy buen libro.', 5, 6, 3),
(11, 'asdads', 2, 2, 3),
(12, 'asdads', 1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libros` int(10) NOT NULL,
  `nombre` text NOT NULL,
  `genero` varchar(40) NOT NULL,
  `capitulos` int(4) NOT NULL,
  `editorial` varchar(40) NOT NULL,
  `anio` int(10) NOT NULL,
  `id_autor_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libros`, `nombre`, `genero`, `capitulos`, `editorial`, `anio`, `id_autor_fk`) VALUES
(3, 'Eso', 'Terror', 1504, 'DEBOLSILLO', 1986, 1),
(4, 'La niebla', 'Terror', 230, 'DEBOLSILLO', 2007, 1),
(5, 'La cúpula', 'Terror', 1074, 'DEBOLSILLO', 2009, 1),
(6, 'Harry Potter y la piedra filosofal', 'Literatura fantástica', 288, 'Salamandra', 1997, 2),
(7, 'Harry Potter y la cámara secreta', 'Literatura fantástica', 320, 'Salamandra', 1998, 2),
(8, 'Harry Potter y el prisionero de Azkaban', 'Literatura fantástica', 384, 'Salamandra', 1999, 2),
(9, 'Harry Potter y el cáliz de fuego', 'Literatura fantástica', 672, 'Salamandra', 2000, 2),
(10, 'Harry Potter y la Orden del Fénix', 'Literatura fantástica', 928, 'Salamandra', 2003, 2),
(11, 'Harry Potter y el misterio del príncipe', 'Literatura fantástica', 576, 'Salamandra', 2005, 2),
(12, 'Harry Potter y las reliquias de la Muerte', 'Literatura fantástica', 880, 'Salamandra', 2007, 2),
(13, 'Cien años de soledad', 'Novela', 496, 'DEBOLSILLO', 1967, 3),
(14, 'Crónica de una muerte anunciada', 'Novela', 144, 'DEBOLSILLO', 1981, 3),
(15, 'El amor en los tiempos del cólera', 'Novela', 442, 'DEBOLSILLO', 1985, 3),
(16, 'Del amor y otros demonios', 'Novela', 176, 'DEBOLSILLO', 1994, 3),
(17, 'La mala hora', 'Novela', 208, 'DEBOLSILLO', 1962, 3),
(18, 'El túnel', 'Novela', 158, 'Sur', 1948, 4),
(19, 'Sobre héroes y tumbas', 'Novela', 417, 'Sur', 1961, 4),
(20, 'Abaddón el exterminador', 'Novela', 528, 'Sur', 1974, 4),
(21, 'Almanegra', 'Novela', 254, 'Suma de letras', 2015, 5),
(22, 'Indias blancas', 'Novela', 356, 'Suma de letras', 2005, 5),
(23, 'El cuarto arcano', 'Novela', 520, 'Suma de letras', 2007, 5),
(24, 'Caballo de fuego', 'Novela', 480, 'Suma de letras', 2011, 5),
(25, 'Jasy', 'Novela', 640, 'Suma de letras', 2014, 5),
(29, 'La caída de la Casa Usher', 'Terror', 136, ' Burton\'s Gentleman\'s Magazine', 1839, 7),
(30, 'El gato negro', 'Terror', 224, 'Edgar Allan Poe', 1843, 7),
(31, 'El señor de los anillos: la comunidad del anillo', 'Literatura fantástica', 398, 'Minotauro', 1958, 8),
(32, 'El señor de los anillos: las dos torres', 'Literatura fantástica', 423, 'Minotauro', 1962, 8),
(33, 'El señor de los anillos: el retorno del rey', 'Literatura fantástica', 542, 'Minotauro', 1968, 8),
(34, 'El Hobbit', 'Literatura fantástica', 652, 'Minotauro', 1937, 8),
(35, 'El Silmarillion', 'Literatura fantástica', 540, 'Minotauro', 1977, 8),
(36, 'Los hombres que no amaban a las mujeres', 'Novela', 665, 'Destino', 2005, 9),
(37, 'La chica que soñaba con una cerilla y un bidón de gasolina', 'Novela', 742, 'Destino', 2005, 9),
(38, 'La reina en el palacio de las corrientes de aire', 'Novela', 880, 'Destino', 2006, 9),
(39, 'El alquimista ', 'Novela', 192, 'Editorial Planeta', 1988, 10),
(40, 'Once minutos', 'Novela', 283, 'Editorial Planeta', 2003, 10),
(41, 'Verónika decide morir', 'Novela', 205, 'Editorial Planeta', 1998, 10),
(42, 'El Peregrino de Compostela', 'Novela', 256, 'Editorial Planeta', 1987, 10),
(43, 'Manual del Guerrero de la Luz', 'Novela', 152, 'Editorial Planeta', 1977, 10),
(44, 'Carrie', 'Terror', 199, 'DEBOLSILLO', 1974, 1),
(45, 'El código Da Vinci', 'Novela', 656, 'Doubleday', 2003, 11),
(46, 'Ángeles y demonios', 'Novela', 606, 'Doubleday', 2000, 11),
(47, 'Origen', 'Novela', 640, 'Doubleday', 2017, 11),
(48, 'El símbolo perdido', 'Novela', 618, 'Doubleday', 2009, 11),
(49, 'Inferno', 'Novela', 551, 'Doubleday', 2003, 11),
(54, 'Juego de tronos', 'Literatura fantástica', 800, 'PLAZA & JANES', 1996, 6),
(55, 'Choque de reyes', 'Literatura fantástica', 928, 'PLAZA & JANES', 1998, 6),
(56, 'Tormenta de espadas', 'Literatura fantástica', 1184, 'PLAZA & JANES', 2000, 6),
(57, 'Festín de cuervos', 'Literatura fantástica', 1133, 'PLAZA & JANES', 2005, 6),
(58, 'Danza de dragones', 'Literatura fantástica', 872, 'PLAZA & JANES', 2011, 6),
(60, 'El general en su laberinto', 'Novela Historica', 20, 'Alfred A. Knopf', 1989, 3),
(61, 'El fantasma de canterville', 'Ficcion Gotica', 7, 'The Court and Society Review', 1887, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(70) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `username`, `password`, `rol`) VALUES
(1, 'admin@mail.com', 'admin', '$2a$12$CG6n2o8hEfD/vTa/KC.T.enw/VuOsXm.JngiG94xm5oYFi.1hH22C', 1),
(2, 'mique@mail.com', 'mique5', '$2y$10$2v/2x3fPN1.sJV37onjD2eygqv.0Jor7b6m0a2zEAeV5VO8DAZldW', 0),
(6, 'prueba@mail.com', 'userPrueba', '$2y$10$7HSBqZSlP70twQH6kgM.v.y6UVNP3i9E63WfcElrrlfPSVuoX02Um', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libros`),
  ADD KEY `id_autor_fk` (`id_autor_fk`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libros` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libros`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor_fk`) REFERENCES `autor` (`id_autor`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
