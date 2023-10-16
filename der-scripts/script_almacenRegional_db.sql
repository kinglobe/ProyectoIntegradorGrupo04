-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema almacen_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema almacen_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `almacen_db` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema craftsy20_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema desafio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema desafio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `desafio` DEFAULT CHARACTER SET utf8mb3 ;
-- -----------------------------------------------------
-- Schema musimundos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema musimundos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `musimundos` DEFAULT CHARACTER SET latin1 ;
-- -----------------------------------------------------
-- Schema almacen_regional_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema almacen_regional_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `almacen_regional_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `almacen_db` ;

-- -----------------------------------------------------
-- Table `almacen_db`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`addresses` (
  `id` INT UNSIGNED NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `province` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `birthday` VARCHAR(255) NOT NULL,
  `about` TEXT(500) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  `rolId` INT UNSIGNED NOT NULL,
  `addressId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  INDEX `users_rol_idx` (`rolId` ASC) VISIBLE,
  INDEX `users_address_fk_idx` (`addressId` ASC) VISIBLE,
  CONSTRAINT `users_rol_fk`
    FOREIGN KEY (`rolId`)
    REFERENCES `almacen_db`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `users_address_fk`
    FOREIGN KEY (`addressId`)
    REFERENCES `almacen_db`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.` order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.` order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `total` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  `userId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_users_fk_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `order_users_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `almacen_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`brands` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`sections` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `price` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  `brandId` INT UNSIGNED NOT NULL,
  `categoryId` INT UNSIGNED NOT NULL,
  `sectionId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `products_brands_fk_idx` (`brandId` ASC) VISIBLE,
  INDEX `products_categories_fk_idx` (`categoryId` ASC) VISIBLE,
  INDEX `products_sections_fk_idx` (`sectionId` ASC) VISIBLE,
  CONSTRAINT `products_brands_fk`
    FOREIGN KEY (`brandId`)
    REFERENCES `almacen_db`.`brands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `products_categories_fk`
    FOREIGN KEY (`categoryId`)
    REFERENCES `almacen_db`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `products_sections_fk`
    FOREIGN KEY (`sectionId`)
    REFERENCES `almacen_db`.`sections` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`images` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(255) NOT NULL,
  `main` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  `productId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `images_products_fk_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `images_products_fk`
    FOREIGN KEY (`productId`)
    REFERENCES `almacen_db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`carts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `priceTotal` INT NOT NULL,
  `subtotal` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `deletedAt` DATETIME NOT NULL,
  `orderId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cart_order_fk_idx` (`orderId` ASC) VISIBLE,
  CONSTRAINT `cart_order_fk`
    FOREIGN KEY (`orderId`)
    REFERENCES `almacen_db`.` order` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_db`.`product_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_db`.`product_cart` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `productId` INT UNSIGNED NOT NULL,
  `cartId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `productCart_product_idx` (`productId` ASC) VISIBLE,
  INDEX `productCart_cart_fk_idx` (`cartId` ASC) VISIBLE,
  CONSTRAINT `productCart_product_fk`
    FOREIGN KEY (`productId`)
    REFERENCES `almacen_db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productCart_cart_fk`
    FOREIGN KEY (`cartId`)
    REFERENCES `almacen_db`.`carts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `desafio` ;

-- -----------------------------------------------------
-- Table `desafio`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `desafio`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `imagen` VARCHAR(255) NOT NULL,
  `inicio` DATE NOT NULL,
  `fin` DATE NOT NULL,
  `cupo` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `desafio`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `contrasena` VARCHAR(255) NOT NULL,
  `categoriaId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_usuarios_categoria_idx` (`categoriaId` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_categoria`
    FOREIGN KEY (`categoriaId`)
    REFERENCES `desafio`.`categorias` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `desafio`.`inscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio`.`inscripciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarioId` INT NULL DEFAULT NULL,
  `cursoId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_curso_usuario_idx` (`cursoId` ASC) VISIBLE,
  INDEX `fk_usuario_curso_idx` (`usuarioId` ASC) VISIBLE,
  CONSTRAINT `fk_curso_usuario`
    FOREIGN KEY (`cursoId`)
    REFERENCES `desafio`.`cursos` (`id`),
  CONSTRAINT `fk_usuario_curso`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `desafio`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `desafio`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio`.`unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `cursoId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_unidades_cursos_idx` (`cursoId` ASC) VISIBLE,
  CONSTRAINT `fk_unidades_cursos`
    FOREIGN KEY (`cursoId`)
    REFERENCES `desafio`.`cursos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `musimundos` ;

-- -----------------------------------------------------
-- Table `musimundos`.`albumes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`albumes` (
  `id` SMALLINT NOT NULL,
  `titulo` VARCHAR(95) NULL DEFAULT NULL,
  `id_artista` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`artistas` (
  `id` SMALLINT NOT NULL,
  `nombre` VARCHAR(85) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`canciones` (
  `id` SMALLINT NOT NULL,
  `nombre` VARCHAR(123) NULL DEFAULT NULL,
  `id_album` SMALLINT NULL DEFAULT NULL,
  `id_tipo_de_medio` TINYINT NULL DEFAULT NULL,
  `id_genero` TINYINT NULL DEFAULT NULL,
  `compositor` VARCHAR(188) NULL DEFAULT NULL,
  `milisegundos` INT NULL DEFAULT NULL,
  `bytes` BIGINT NULL DEFAULT NULL,
  `precio_unitario` DECIMAL(3,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`canciones_de_playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`canciones_de_playlists` (
  `id_playlist` TINYINT NULL DEFAULT NULL,
  `id_cancion` SMALLINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`clientes` (
  `id` TINYINT NOT NULL,
  `primer_nombre` VARCHAR(9) NULL DEFAULT NULL,
  `apellido` VARCHAR(12) NULL DEFAULT NULL,
  `empresa` VARCHAR(48) NULL DEFAULT NULL,
  `direccion` VARCHAR(40) NULL DEFAULT NULL,
  `ciudad` VARCHAR(19) NULL DEFAULT NULL,
  `estado_o_provincia` VARCHAR(6) NULL DEFAULT NULL,
  `pais` VARCHAR(14) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(10) NULL DEFAULT NULL,
  `telefono` VARCHAR(19) NULL DEFAULT NULL,
  `fax` VARCHAR(18) NULL DEFAULT NULL,
  `email` VARCHAR(29) NULL DEFAULT NULL,
  `id_representante` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`empleados` (
  `id` TINYINT NOT NULL,
  `apellido` VARCHAR(8) NULL DEFAULT NULL,
  `nombre` VARCHAR(8) NULL DEFAULT NULL,
  `titulo` VARCHAR(19) NULL DEFAULT NULL,
  `reporta_a` VARCHAR(1) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `fecha_de_contratacion` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(27) NULL DEFAULT NULL,
  `ciudad` VARCHAR(10) NULL DEFAULT NULL,
  `estado_o_provincia` VARCHAR(2) NULL DEFAULT NULL,
  `pais` VARCHAR(6) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(7) NULL DEFAULT NULL,
  `telefono` VARCHAR(17) NULL DEFAULT NULL,
  `fax` VARCHAR(17) NULL DEFAULT NULL,
  `email` VARCHAR(24) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`facturas` (
  `id` SMALLINT NOT NULL,
  `id_cliente` TINYINT NULL DEFAULT NULL,
  `fecha_factura` DATE NULL DEFAULT NULL,
  `direccion_de_facturacion` VARCHAR(40) NULL DEFAULT NULL,
  `ciudad_de_facturacion` VARCHAR(19) NULL DEFAULT NULL,
  `estado_o_provincia_de_facturacion` VARCHAR(6) NULL DEFAULT NULL,
  `pais_de_facturacion` VARCHAR(14) NULL DEFAULT NULL,
  `codigo_postal_de_facturacion` VARCHAR(10) NULL DEFAULT NULL,
  `total` DECIMAL(4,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`generos` (
  `id` TINYINT NOT NULL,
  `nombre` VARCHAR(18) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`items_de_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`items_de_facturas` (
  `id` SMALLINT NOT NULL,
  `id_factura` SMALLINT NULL DEFAULT NULL,
  `id_cancion` SMALLINT NULL DEFAULT NULL,
  `precio_unitario` DECIMAL(3,2) NULL DEFAULT NULL,
  `cantidad` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`playlists` (
  `id` TINYINT NULL DEFAULT NULL,
  `nombre` VARCHAR(26) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `musimundos`.`tipos_de_medio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musimundos`.`tipos_de_medio` (
  `id` TINYINT NULL DEFAULT NULL,
  `nombre` VARCHAR(27) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `almacen_regional_db` ;

-- -----------------------------------------------------
-- Table `almacen_regional_db`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `province` VARCHAR(255) NULL DEFAULT NULL,
  `userId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`brands` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`carts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL DEFAULT NULL,
  `orderId` INT NULL DEFAULT NULL,
  `productId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(255) NULL DEFAULT NULL,
  `main` TINYINT(1) NULL DEFAULT NULL,
  `productId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `total` INT NULL DEFAULT NULL,
  `userId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `discount` INT UNSIGNED NULL DEFAULT '0',
  `categoriId` INT NOT NULL,
  `sectionId` INT NULL DEFAULT '1',
  `brandId` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`sections` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`sequelizemeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`sequelizemeta` (
  `name` VARCHAR(255) COLLATE 'utf8mb3_unicode_ci' NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `almacen_regional_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `almacen_regional_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `surname` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `roleId` INT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
