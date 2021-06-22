const db = require('./db')

const Post = db.sequelize.define('usuario_inova',
{
    id_usuario:{
        type: db.Sequelize.INTEGER,
        primaryKey: true,
    },
    email: {
        type: db.Sequelize.STRING
    },
    senha:{
        type: db.Sequelize.STRING
    }
},
{
    timestamps: false,
    tablename: 'usuario_inova', 
    freezeTableName: true
}
)
module.exports = Post

    