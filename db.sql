--para tu xammp, solo importa :)


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE SCHEMA IF NOT EXISTS `contactos` DEFAULT CHARACTER SET utf8 ;
USE `contactos` ;

  
CREATE TABLE IF NOT EXISTS `contactos`.`persona` (
  `documento` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`documento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `contactos`.`tipo_contacto` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `contactos`.`contacto` (
  `id` INT(11) NOT NULL,
  `doc_persona` INT(11) NOT NULL,
  `id_tipo` INT(11) NOT NULL,
  `valor` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `con_tip_fk` (`id_tipo` ASC),
  INDEX `con_per_fk` (`doc_persona` ASC),
  CONSTRAINT `con_per_fk`
    FOREIGN KEY (`doc_persona`)
    REFERENCES `contactos`.`persona` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `con_tip_fk`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `contactos`.`tipo_contacto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `contactos`.`Tomador` (
  `idDocTomador` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(45) NOT NULL,
  `TipoDoc` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDocTomador`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `contactos`.`Vehiculo` (
  `idVehiculo` INT NOT NULL AUTO_INCREMENT,
  `tipoVehiculo` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `año` INT NOT NULL,
  `uso` VARCHAR(45) NOT NULL,
  `Tomador_idDocTomador` INT NOT NULL,
  PRIMARY KEY (`idVehiculo`, `Tomador_idDocTomador`),
  INDEX `fk_Vehiculo_Tomador1_idx` (`Tomador_idDocTomador` ASC),
  CONSTRAINT `fk_Vehiculo_Tomador1`
    FOREIGN KEY (`Tomador_idDocTomador`)
    REFERENCES `contactos`.`Tomador` (`idDocTomador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contactos`.`Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contactos`.`Poliza` (
  `idPoliza` INT NOT NULL AUTO_INCREMENT,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Cobertura` VARCHAR(45) NOT NULL,
  `ValorAsegurado` INT NOT NULL,
  `Tomador_idDocTomador` INT NOT NULL,
  `Vehiculo_idVehiculo` INT NOT NULL,
  `Vehiculo_Tomador_idDocTomador` INT NOT NULL,
  PRIMARY KEY (`idPoliza`, `Tomador_idDocTomador`),
  INDEX `fk_Poliza_Tomador1_idx` (`Tomador_idDocTomador` ASC),
  INDEX `fk_Poliza_Vehiculo2_idx` (`Vehiculo_idVehiculo` ASC, `Vehiculo_Tomador_idDocTomador` ASC),
  CONSTRAINT `fk_Poliza_Tomador1`
    FOREIGN KEY (`Tomador_idDocTomador`)
    REFERENCES `contactos`.`Tomador` (`idDocTomador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Vehiculo2`
    FOREIGN KEY (`Vehiculo_idVehiculo` , `Vehiculo_Tomador_idDocTomador`)
    REFERENCES `contactos`.`Vehiculo` (`idVehiculo` , `Tomador_idDocTomador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `contactos`.`Telefono` (
  `idTelefono` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `Tomador_idDocTomador` INT NOT NULL,
  PRIMARY KEY (`idTelefono`, `Tomador_idDocTomador`),
  INDEX `fk_Telefono_Tomador1_idx` (`Tomador_idDocTomador` ASC),
  CONSTRAINT `fk_Telefono_Tomador1`
    FOREIGN KEY (`Tomador_idDocTomador`)
    REFERENCES `contactos`.`Tomador` (`idDocTomador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




INSERT INTO  tomador (Nombres,TipoDoc,Direccion,Correo)
VALUES ('sutanito','CC','calle imaginaria', 's@gmail.com'),('pepita','TI','calle 2', 'pp@gmail.com'),('loco','CC','cr 3', 'loca@gmail.com'),('meg','TI','cr 4', 'meg@gmail.com');

INSERT INTO  vehiculo (tipoVehiculo,placa,marca,modelo,año,uso,Tomador_idDocTomador)
VALUES ('carro','asdaf','vmw','2a',2000,'nuevo',1), ('camion','uoyq','mazda','3a',2020,'usado',1),('moto','as234f','vmw','2a',2000,'nuevo',4), ('carro','123gg','mazda','1a',2020,'usado',2);

INSERT INTO `Poliza` (`idPoliza`, `Ciudad`, `Cobertura`, `ValorAsegurado`, `Tomador_idDocTomador`, `Vehiculo_idVehiculo`, `Vehiculo_Tomador_idDocTomador`) VALUES (NULL, 'Bogota', 'robo', '100', '1', '3', '4'), (NULL, 'Cali', 'empleo', '50', '1', '1', '1'), (NULL, 'Bogota', 'vida', '100', '2', '4', '2'), (NULL, 'Medellin', 'robo', '50', '4', '3', '4');

INSERT INTO `persona` (`documento`, `nombre`, `apellidos`) VALUES ('1', 'ana', 'jimenez'), ('2', 'juan', 'perez'), ('3', 'maria', 'gomez'), ('4', 'natalia', 'salcedo'), ('5', 'andrea', 'mantes')

INSERT INTO `tipo_contacto` (`id`, `nombre`, `descripcion`) VALUES ('1', 'direccion', NULL), ('2', 'telefono', NULL), ('3', 'mail', NULL), ('4', 'instagram', NULL), ('5', 'twitter', NULL)

INSERT INTO `contacto` (`id`, `doc_persona`, `id_tipo`, `valor`) VALUES ('1', '1', '1', 'cra 7 40-53'), ('2', '1', '2', '6013239300'), ('3', '1', '2', '3002141824'), ('4', '1', '3', 'ana.jimenez@udi'), ('5', '2', '2', '6012151617'), ('6', '2', '3', 'juanP@gmail.com'), ('7', '3', '3', 'Mgomez@udis'), ('8', '4', '5', '@natalias'), ('9', '5', '3', 'amontes2022@gmail'), ('10', '5', '4', '@montesa')

