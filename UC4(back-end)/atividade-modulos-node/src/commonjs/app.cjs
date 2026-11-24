const { TAXA_ENTREGA,
    calcularTotal,
    validarPedido } = require('./orders/order-service.cjs')

    const carrinho = ["Hambúrguer", "Batata Frita"];

    console.log(`Taxa de entrega: R$ ${TAXA_ENTREGA.toFixed(2).replace('.',',')}`);

    if(validarPedido(carrinho)){
        console.log("Pedido validado");
        console.log(`Total a pagar: ${calcularTotal(35)}`)
    }else{
        console.log("Carrinho esta vazio")
    }