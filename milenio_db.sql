-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2024 a las 18:01:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `milenio_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Ciencia', 'Género literario que se basa en hechos científicos, teorías y descubrimientos.'),
(2, 'Distopía', 'Género que describe sociedades futuras y opresivas, a menudo relacionadas con la opresión política y la tecnología.'),
(3, 'Fantasía', 'Género literario caracterizado por la presencia de elementos mágicos, criaturas sobrenaturales y mundos imaginarios.'),
(4, 'Ficción', 'Género literario que presenta eventos, personajes y situaciones que no corresponden a la realidad.'),
(5, 'Filosofía', 'Género que aborda cuestiones abstractas sobre la existencia, el conocimiento y la moralidad.'),
(6, 'Realismo Mágico', 'Género literario en el que lo fantástico se presenta como algo cotidiano en un entorno realista.'),
(7, 'Romántica', 'Género que pone énfasis en los sentimientos, el amor y la emoción humana.'),
(8, 'Novela', 'Narración extensa que se desarrolla en varios capítulos, con múltiples personajes y eventos.'),
(9, 'Cuento', 'Género narrativo breve que presenta una historia ficticia, generalmente con un solo tema o conflicto.'),
(10, 'Fábula', 'Género narrativo en el que los personajes son animales u objetos inanimados que representan características humanas.'),
(11, 'Poesía', 'Género literario caracterizado por su uso del verso, la métrica y la expresión estética.'),
(12, 'Mito', 'Narración tradicional que explica fenómenos naturales, sociales o culturales mediante seres y deidades.'),
(13, 'Leyenda', 'Narración tradicional que mezcla hechos reales y elementos fantásticos o sobrenaturales.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `reseña` text DEFAULT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `reseña`, `genero_id`) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Cien años de soledad es una obra maestra de Gabriel García Márquez que nos transporta a través de generaciones y nos sumerge en un mundo mágico y surrealista lleno de personajes inolvidables y situaciones extraordinarias. La novela es una reflexión profunda sobre la historia, el amor, la soledad, la memoria y el destino. García Márquez entrelaza la historia personal de una familia con la historia colectiva de Latinoamérica, ofreciendo una visión mágica y a la vez dolorosamente real de la humanidad.', 6),
(2, 'El nombre de la rosa', 'Umberto Eco', 'Una novela histórica que combina misterio, filosofía y crítica literaria en un monasterio italiano del siglo XIV.', 4),
(3, 'El origen de las especies', 'Charles Darwin', 'La obra fundamental de la biología evolutiva que propone la teoría de la evolución por selección natural.', 1),
(4, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'La primera entrega de la saga de Harry Potter, donde un niño descubre que es un mago y empieza su educación en Hogwarts.', 3),
(5, 'Cumbres borrascosas', 'Emily Brontë', 'Un clásico de la literatura inglesa que narra la tumultuosa relación entre Heathcliff y Catherine Earnshaw.', 7),
(6, 'El arte de la guerra', 'Sun Tzu', 'Un antiguo tratado militar chino que ofrece estrategias sobre la guerra y el liderazgo, aplicable a diversas áreas de la vida.', 5),
(7, 'El Principito', 'Antoine de Saint-Exupéry', 'La obra de Antoine de Saint-Exupéry es la historia de un piloto que estando en el desierto se encuentra con un pequeño príncipe que proviene de otro planeta. Este príncipe (o principito) es un pequeño niño rubio muy peculiar. El curioso personaje le describe sus aventuras por diferentes planetas y por la tierra, y le permite experimentar una serie de enseñanzas muy especiales sobre la vida.', 3),
(8, '1984', 'George Orwell', 'En un mundo totalitario gobernado por el Gran Hermano, Winston Smith, un empleado del Partido, comienza a cuestionar la opresión y la vigilancia constante del gobierno. 1984 es una crítica feroz al totalitarismo, la manipulación de la verdad y el control social. El libro explora la lucha individual contra un sistema represivo y las consecuencias de vivir en una sociedad donde la privacidad y la libertad han desaparecido.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`) VALUES
(1, 'webadmin', 'webadmin@gmail.com', '$2y$10$l9BxiGf1dfR.ZqunEiT8YekGtmgxZO9MDtMK8rn4x0i6y7XVo8fjy');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genero_libro` (`genero_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_genero_libro` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
