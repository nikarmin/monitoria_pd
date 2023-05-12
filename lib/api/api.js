const express = require('express');
const app = express()
app.use(express.json())
let arrayData = [
    {
        "id": 1,
        "nome": "João Pedro",
        "imagem": "https://ibb.co/WzQQvcW",
        "curso": "Informática",
        "email": "cc21687@g.unicamp.br",
        "horarios": "Segunda: 08:15-09:45\r\nTerça: -x-\r\nQuarta: 10:00-12:15, 13:30-14h45\r\nQuinta: 10:00-12:15\r\nSexta: 11:30-12:15, 17:30-18:15, 19:00-21:00\r\nSábado: -x-"
    },
    {
        "id": 2,
        "nome": "Miguel",
        "imagem": "https://uploaddeimagens.com.br/images/004/463/597/original/0f49a891-06f8-4a79-812a-dd71fabb57f6.jpeg?1683899888",
        "curso": "Desenvolvimento de Sistemas",
        "email": "cc22327@g.unicamp.br",
        "horarios": "Segunda: 13:30 - 14:15, 16:00-18:15\r\nTerça: 18:15-19:00\r\nQuarta: 18:15-19:00\r\nQuinta: 13:30-14:15\r\nSexta: 13:30-14:15, 16:45-18:15\r\nSábado: 07:30-12:15"
    },
    {
        "id": 3,
        "nome": "Bruno Concli",
        "imagem": "https://uploaddeimagens.com.br/images/004/463/597/original/0f49a891-06f8-4a79-812a-dd71fabb57f6.jpeg?1683899888",
        "curso": "Desenvolvimento de Sistemas",
        "email": "cc22303@g.unicamp.br",
        "horarios": "Segunda: 16:00-19:00\r\nTerça: 16:45-18:15\r\nQuarta: -x-\r\nQuinta: 18:15-19:45\r\nSexta: 16:45-18:15\r\nSábado: 07:30-11:30"
    },
    {
        "id": 4,
        "nome": "Bruno Borges",
        "imagem": "https://uploaddeimagens.com.br/images/004/463/597/original/0f49a891-06f8-4a79-812a-dd71fabb57f6.jpeg?1683899888",
        "curso": "Informática",
        "email": "cc22123@g.unicamp.br",
        "horarios": "Segunda: -x-\r\nTerça: 10:45-11:30\r\nQuarta: 08:15-10:45, 13:30-18:15 \r\nQuinta: -x- \r\nSexta: 10:45-11:30, 13:30-15:00\r\nSábado: 10:00-12:15"
    },
    {
        "id": 5,
        "nome": "Isa",
        "imagem": "https://uploaddeimagens.com.br/images/004/463/597/original/0f49a891-06f8-4a79-812a-dd71fabb57f6.jpeg?1683899888",
        "curso": "Desenvolvimento de Sistemas",
        "email": "cc20000@g.unicamp.br",
        "horarios": "Segunda: 20:30-21:00\r\nTerça: 18:15-23:00\r\nQuarta: 17:30-19:00\r\nQuinta: 17:30-19:00\r\nSexta: 17:30-19:00\r\nSábado: -x-"
    },
];

app.get('/api/monitor/get', function (req, res) {
    setTimeout(function () {
        res.header('Access-Control-Allow-Origin', '*')
            .send(200, arrayData)
    }, 3000);
});


app.get('/api/monitor/getNome/:nome', (req, res) => {
    const nome = req.params.nome;
    const item = data.find(item => item.nome == nome);
    return res.json(item);
});

app.post('/api/monitor/post', (req, res) => {
    const id = req.body.id;
    const nome = req.body.nome;
    const curso = req.body.curso;
    const horarios = req.body.horarios;
    const imagem = req.body.imagem;
    return res.json({ id, nome, curso, imagem, horarios });
});

app.put('/api/monitor/put/:id', (req, res) => {
    const id = req.params.id;
    const item = data.find(item => item.id == id);
    item.nome = req.body.nome;
    item.curso = req.body.curso;
    item.imagem = req.body.imagem;
    item.horarios = req.body.horarios;
    return res.json(item);
});

app.get('/api/monitor/delete/:id', (req, res) => {
    const id = req.params.id;
    const item = data.find(item => item.id == id);
    return res.json(item);
});

app.listen(3000);
console.log('A API está no ar');