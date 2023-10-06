const titulo = document.getElementById('titulo');
titulo.innerText = 'Titulo da pagina inserido com Javascript.'
const linkProz = document.querySelector('a');
linkProz.innerText = 'Proz Educação'
const listaNaoOrdenada = document.querySelector('ul');
listaNaoOrdenada.innerHTML = `
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
`
const listaOrdenada = document.querySelector('ol');
listaOrdenada.innerHTML = `
    <li><a href="https://www.youtube.com/" target="_blank">Youtube</a></li>
    <li><a href="https://www.twitch.tv/" target="_blank">Twitch</a></li>
    <li><a href="https://www.tiktok.com/" target="_blank">Tiktok</a></li>
`