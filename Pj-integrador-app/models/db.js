//Conexão com o Banco de dados
const Sequelize = require('sequelize')
const sequelize = new Sequelize('integradorfim', 'root', 'cabeçavazia',{
    host: "localhost",
    dialect: 'mysql'
})

module.exports = {
    Sequelize: Sequelize,
    sequelize: sequelize

}