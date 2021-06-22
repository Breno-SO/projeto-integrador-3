const db = require('./db')

const Post = db.sequelize.define('projeto',
{
    id_projeto:{
        type: db.Sequelize.INTEGER,
        primaryKey: true,
    },
    descricao: {
        type: db.Sequelize.TEXT
    },
    produto: {
        type: db.Sequelize.TEXT
    },
    situacao: {
        type: db.Sequelize.STRING
    },
    nome_completo:{
        type: db.Sequelize.STRING
    },
    email: {
        type: db.Sequelize.STRING
    },
    telefone: {
        type: db.Sequelize.STRING
    },
    organizacao: {
        type: db.Sequelize.STRING
    },
    contato_unisales: {
        type: db.Sequelize.STRING
    }
},
{
    tablename: 'projeto', 
    freezeTableName: true
}
)
module.exports = Post

    