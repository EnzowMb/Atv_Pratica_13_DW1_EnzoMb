CREATE DATABASE `Tarefas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
use Tarefas;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `login` varchar(250) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select nome, login from usuarios where login='eu' and senha='123';

CREATE TABLE `tarefas` (
  `id_tarefa` int(11) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `data_criacao` varchar(20) DEFAULT NULL,
  `data_conclusao` varchar(20) DEFAULT NULL,
  `status` boolean DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_tarefa`),
  CONSTRAINT fk_idUser FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;