const body = document.querySelector('body');

const titulo = document.createElement('h1');
titulo.id = 'titulo'
titulo.innerText = 'Produto a Venda';

const nomeProduto = 'Whey Protein Isolado 1kg - Growth Supplements';
const descricaoProduto = 'Produto com altíssima concentração de proteínas, o suplemento whey protein isolado é a melhor escolha para quem deseja garantir excelentes fontes proteicas para o desenvolvimento do corpo';
const precoProduto = 144.00;
const pathFotoProduto = './assets/whey-isolado-growth-v2.png'

const elementoProduto = document.createElement('div');
elementoProduto.innerHTML = `
    <img class="produto-photo" src="${pathFotoProduto}" alt="Foto ${nomeProduto}" height="320"></img>
    <h3 class="produto-nome">${nomeProduto}</h3>
    <p class="produto-descricao">${descricaoProduto}</p>
    <span class="produto-preco">R$ ${precoProduto.toFixed(2)}</span>
`;
body.appendChild(titulo);
body.appendChild(elementoProduto);

