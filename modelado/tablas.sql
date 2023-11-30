-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CATEGORIAS` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROVEEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROVEEDORES` (
  `id` INT NOT NULL,
  `razonsocial` VARCHAR(45) NULL,
  `ruc` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `direccion` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PRODUCTOS` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  `modelo` VARCHAR(45) NULL,
  `stock` INT(10) NULL,
  `precio` DOUBLE NULL,
  `imagen` VARCHAR(45) NULL,
  `CATEGORIAS_id` INT NOT NULL,
  `PROVEEDORES_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLIENTES` (
  `id` INT NOT NULL,
  `razonsocial` VARCHAR(45) NULL,
  `documento` VARCHAR(45) NULL,
  `direccion` VARCHAR(250) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `USUARIOS` (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `nivel` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENDEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VENDEDORES` (
  `id` INT NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `dni` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `fecnac` DATE NULL,
  `direccion` VARCHAR(250) NULL,
  `USUARIOS_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMPROBANTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COMPROBANTES` (
  `id` INT NOT NULL,
  `numero` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `fecha` DATETIME NULL,
  `subtotal` DOUBLE NULL,
  `igv` DOUBLE NULL,
  `total` DOUBLE NULL,
  `CLIENTES_id` INT NOT NULL,
  `VENDEDORES_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETALLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DETALLE` (
  `id` INT NOT NULL,
  `cantidad` INT NULL,
  `precio` DOUBLE NULL,
  `importe` DOUBLE NULL,
  `PRODUCTOS_id` INT NOT NULL,
  `COMPROBANTES_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;