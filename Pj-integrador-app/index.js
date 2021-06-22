const express = require("express");
const app = express();
const handlebars = require('express-handlebars')
const bodyParser = require('body-parser')
const Post =  require('./models/Post')
const path = require('path')

//app.use(express.static('public'));
app.use(express.static(__dirname+'/public'));

//Config
    //Template Engine
        app.engine('handlebars', handlebars({defaultLayout: 'main'}))
        app.set('view engine', 'handlebars')
    //Body Parser
        app.use(bodyParser.urlencoded({extended: false}))
        app.use(bodyParser.json())

//Rotas
    //Pagina Principal lista de postagens
    app.get('/', function(req,res){
        Post.findAll({order: [['id_projeto', 'DESC']]}).then(function(posts){
            res.render('User',{
                posts: posts,
                style: 'styleuser.css',
                tipo: 'Todos projetos recebidos',
                img: 'capa.jpeg'
            });
        })
    })
    //Pagina de projetos aprovados
    app.get('/aceitos', function(req,res){
        Post.findAll({where:{'situacao': 'Aprovado' },order: [['id_projeto', 'DESC']]}).then(function(posts){
            res.render('User',{
                posts: posts,
                style: 'styleuser.css',
                tipo: 'Projetos Aprovados',
                img: 'capa.jpeg'
            });
        })
    })
     //Pagina de projetos recusados
    app.get('/negados', function(req,res){
        Post.findAll({where:{'situacao': 'Recusado' },order: [['id_projeto', 'DESC']]}).then(function(posts){
            res.render('User',{
                posts: posts,
                style: 'styleuser.css',
                tipo: 'Projetos Negados',
                img: 'capa.jpeg'
            });
        })
    })
     //Pagina de projetos ainda não analisados
    app.get('/analise', function(req,res){
        Post.findAll({where:{'situacao': 'em analise' },order: [['id_projeto', 'DESC']]}).then(function(posts){
            res.render('User',{
                posts: posts,
                style: 'styleuser.css',
                tipo: 'Projetos Sem Avaliação',
                img: 'capa.jpeg'
            });
        })
    })
    //Pagina de Avaliação de Projetos
    app.get('/detalhe/:id_projeto', function(req, res) {
        id_projeto = req.params.id_projeto
        Post.findAll({where:{'id_projeto': req.params.id_projeto },order: [['id_projeto', 'DESC']]}).then(function(posts){
        res.render('detalhe',{
            posts: posts,
            style: 'detalhe.css',
            
        });
    });
});
// Rota de atualização de situação do projeto
app.post('/att', (req, res) => {
    Post.update({
        situacao: req.body.situacao
    }, {
        where: { id_projeto: id_projeto },
    }).then(() => {
        res.redirect('/')
    })
})
    

    //Pagina de cadastro de postagens
    app.get('/cad', function(req, res){
        res.render('cadastroprojeto',{
            style: 'stylecadproj.css',
            img: 'logotop.png'
        });

    });

    //Rota de adição de elementos ao banco de dados
    app.post('/add', function(req, res){
        Post.create({
            descricao: req.body.descricao,
            produto: req.body.produto,
            nome_completo:  req.body.nome_completo,
            email:  req.body.email,
            telefone:  req.body.telefone,
            organizacao:  req.body.organizacao,
            contato_unisales:  req.body.contato_unisales
        }).then(function(){
            res.redirect('/cad')
        }).catch(function(erro){
            res.end("Houve um erro: " + erro)
        })
    })
    //Rota de exclusão de postagens
    app.get('/deletar/:id_projeto', function(req, res){
        Post.destroy({where: {'id_projeto': req.params.id_projeto}}).then(function(){
        
        }).then(function(){
            res.redirect('/')
        }).catch(function(erro){
            res.send("Essa postagem não existe")
        })
    })
    //Pagina do formulario de update
    app.get('/editar/:id_projeto', function(req, res) {
        id_projeto = req.params.id_projeto
        res.render('editar',{
            style: 'edicao.css'
        });
    });
    //Rota de update no banco
    app.post('/edit', (req, res) => {
        Post.update({
            tema: req.body.tema,
            descricao: req.body.descricao,
            cometario: req.body.cometario,
            status: req.body.status,
            resumo: req.body.resumo
        }, {
            where: { id_projeto: id_projeto },
        }).then(() => {
            res.redirect('/')
        })
    })




    //Parte de login!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

var mysql = require('mysql');
var session = require('express-session');
const { request } = require('http');
const Poste =  require('./models/Poste')



//conexão com o banco de dados
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : 'cabeçavazia',
	database : 'integradorfim'
});

// configurações Express
app.use(session({
	secret: 'segredo',
	resave: true,
	saveUninitialized: true
}));
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

    //Renderizando formulario de login para o usuario
    app.get('/log', function(request, response) {
        response.sendFile(path.join(__dirname + '/Adm.html'));
    });
    //Rota de login
    app.post('/auth', function(request, response) {
        var email = request.body.email;
        var senha = request.body.senha;
        if (email && senha) {
            connection.query('SELECT * FROM usuario_inova WHERE email = ? AND senha = ?', [email, senha], function(error, results, fields) {
                if (results.length > 0) {
                    request.session.loggedin = true;
                    request.session.email = email;
                    response.redirect('/');
                } else {
                    response.send('Incorrect Username and/or Password!');
                }			
                response.end();
            });
        } else {
            response.send('Please enter Username and Password!');
            response.end();
        }
    });

    //pagina home (usada para testes)
    app.get('/teste', function(request, response) {
        if (request.session.loggedin) {
            response.send('Welcome back, ' + request.session.username + '!');
        } else {
            response.send('Please login to view this page!');
        }
        response.end();
    });

    
    app.get('/regis', function(request, response) {
        response.sendFile(path.join(__dirname + '/registro.html'));
    });

    //Renderizando Formulario de cadastro
    app.get('/cadu', function(req, res){
        res.render('Cadastro',{
            style: 'style.css',
            img: 'logotop.png'
        });

    });
            
    //Rota de adição de elementos ao banco de dados
    app.post('/adc', function(req, res){
        Poste.create({
            email: req.body.email,
            senha: req.body.senha
        }).then(function(){
            res.redirect('/')
        }).catch(function(erro){
            res.end("Houve um erro: " + erro)
        })
    })

app.listen(8081, function(){
    console.log("Servidor Rodando na url http://localhost:8081")
});