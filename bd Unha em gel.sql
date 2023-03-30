-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Cpf` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `CPF` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  `Endereco` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servicos` (
  `idServicos` INT NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NOT NULL,
  `valor_servico` DECIMAL(8,2) NOT NULL,
  `Tipo_servico` VARCHAR(45) NOT NULL,
  `Funcionario_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idServicos`, `Funcionario_CPF`),
  INDEX `fk_Servicos_Funcionario1_idx` (`Funcionario_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Servicos_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `mydb`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_has_Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_has_Servicos` (
  `Cliente_Cpf` VARCHAR(11) NOT NULL,
  `Servicos_idServicos` INT NOT NULL,
  PRIMARY KEY (`Cliente_Cpf`, `Servicos_idServicos`),
  INDEX `fk_Cliente_has_Servicos_Servicos1_idx` (`Servicos_idServicos` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Servicos_Cliente_idx` (`Cliente_Cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Servicos_Cliente`
    FOREIGN KEY (`Cliente_Cpf`)
    REFERENCES `mydb`.`Cliente` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Servicos_Servicos1`
    FOREIGN KEY (`Servicos_idServicos`)
    REFERENCES `mydb`.`Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `idCursos` INT NOT NULL,
  `Valor_Curso` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_has_Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_has_Cursos` (
  `Cliente_Cpf` VARCHAR(11) NOT NULL,
  `Cursos_idCursos` INT NOT NULL,
  PRIMARY KEY (`Cliente_Cpf`, `Cursos_idCursos`),
  INDEX `fk_Cliente_has_Cursos_Cursos1_idx` (`Cursos_idCursos` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Cursos_Cliente1_idx` (`Cliente_Cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Cursos_Cliente1`
    FOREIGN KEY (`Cliente_Cpf`)
    REFERENCES `mydb`.`Cliente` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Cursos_Cursos1`
    FOREIGN KEY (`Cursos_idCursos`)
    REFERENCES `mydb`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO cliente
VALUES ('12425307036', 'Alícia Clara Novaes', 'alicia_novaes@sebrace.com.br', '98156-0662');

INSERT INTO cliente
VALUES ('54105036009', 'Lorena Luna Peixoto', 'lorena-peixoto75@mushsanches.com', '99659-5927');

INSERT INTO cliente
VALUES ('23756947084', 'Luana Cecília Malu Aragão', 'luana_aragao@gutembier.com.br', '99145-3464');

INSERT INTO cliente
VALUES ('99287813035', 'Camila Luciana Maya Nunes', 'camila_nunes@live.com.br', '98585-2538');

INSERT INTO cliente
VALUES ('72073677088', 'Nicole Débora Fernanda Teixeira', 'nicole_teixeira@academiaconcerto.art.br', '99532-7725');

INSERT INTO cliente
VALUES ('56203756091', 'Isabella Helena Alana Baptista', 'isabella_helena_baptista@hushmail.com', '99532-7725');

INSERT INTO cliente
VALUES ('62808204086', 'Stefany Vitória Heloisa Aparício', 'stefany-aparicio94@cheryamur.com.br', '99826-1831');

INSERT INTO cliente
VALUES ('85170935005', 'Heloisa Rita Campos', 'heloisa_rita_campos@rmsolutions.inf.br', '99117-0830');

INSERT INTO cliente
VALUES ('23567959018', 'Teresinha Brenda Daniela Rocha', 'teresinha_brenda_rocha@recatec.com.br', '99321-0050');

INSERT INTO cliente
VALUES ('62469761077', 'Alícia Isabel Vieira', 'alicia_vieira@dep.ufscar.br', '98132-1447');


INSERT INTO Funcionario
VALUES ('45467239627', 'Marlene Elza Assis', '99994669605', 'Travessa Campos Sales - Caxias / MA');

INSERT INTO Funcionario
VALUES ('99733254274', 'Renata Gabrielly Fernandes', '83984899643', 'Rua da Sapucaia - João Pessoa / PB');

INSERT INTO Funcionario
VALUES ('50743676114', 'Alessandra Betina Pietra da Cunha', '21995137068', 'Rua Charruas - Teresópolis / RJ');

INSERT INTO servicos
VALUES (1 , '2022/02/13', 80.00, 'Nail Art', '45467239627');

INSERT INTO servicos
VALUES (2 , '2022/07/20', 30.00, 'Pedicure', '99733254274');

INSERT INTO servicos
VALUES (3 , '2022/05/02', 50.00, 'Maincure', '50743676114');

INSERT INTO servicos
VALUES (4 , '2022/02/13', 100.00, 'Unhas de porcelana', '45467239627');

INSERT INTO servicos
VALUES (5 , '2022/05/07', 70.00, 'Unhas de gel', '50743676114');

INSERT INTO servicos
VALUES (6 , '2022/09/12', 120.00, 'Unha stiletto', '99733254274');

INSERT INTO servicos
VALUES (7 , '2022/02/14', 30.00, 'Paincure', '99733254274');

INSERT INTO servicos
VALUES (8 , '2022/03/19', 100.00, 'Unhas de fibra de vidro', '45467239627');

INSERT INTO servicos
VALUES (9 , '2021/06/27', 60.00, 'Unha stiletto', '50743676114');

INSERT INTO servicos
VALUES (10 , '2022/08/29', 70.00, 'Francesinha', '50743676114');

INSERT INTO cursos
VALUES (1, 2000.00);

INSERT INTO cursos
VALUES (2, 3000.00);

INSERT INTO cursos
VALUES (3, 4000.00);

INSERT INTO cursos
VALUES (4, 1500.00);

INSERT INTO cursos
VALUES (5, 1200.00);

RENAME TABLE cliente_has_cursos TO Clientes_possuem_cursos;
RENAME TABLE  cliente_has_servicos TO  cliente_agendou_servicos ;


INSERT INTO cliente_agendou_servicos
VALUES ('12425307036',1);

INSERT INTO cliente_agendou_servicos
VALUES ('54105036009',2);

INSERT INTO cliente_agendou_servicos
VALUES ('23756947084',3);

INSERT INTO cliente_agendou_servicos
VALUES ('99287813035',4);

INSERT INTO cliente_agendou_servicos
VALUES ('72073677088',5);

INSERT INTO cliente_agendou_servicos
VALUES ('56203756091',6);

INSERT INTO cliente_agendou_servicos
VALUES ('62808204086',7);

INSERT INTO cliente_agendou_servicos
VALUES ('85170935005',8);

INSERT INTO cliente_agendou_servicos
VALUES ('23567959018',9);

INSERT INTO cliente_agendou_servicos
VALUES ('62469761077',10);

