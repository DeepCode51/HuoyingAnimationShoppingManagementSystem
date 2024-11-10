//同订单号合并订单号、支付信息、收货地址、发货情况和操作
var orderId=document.getElementsByName("orderId");
var orderPay=document.getElementsByName("orderPay");
var orderAddress=document.getElementsByName("orderAddress");
var orderDeliveryStatus=document.getElementsByName("orderDeliveryStatus");
var orderWay=document.getElementsByName("orderWay");
let ij=1;
for(let i=0;i<orderId.length-1;i++){
    for(let j=i+1;j<orderId.length;j++){
        if(orderId[i].innerText==orderId[j].innerText){
            ij++;
        }else{
            break;
        }
    }
    if(ij>1){
        orderId[i].setAttribute("rowspan",ij);
        orderPay[i].setAttribute("rowspan",ij);
        orderAddress[i].setAttribute("rowspan",ij);
        orderDeliveryStatus[i].setAttribute("rowspan",ij);
        orderWay[i].setAttribute("rowspan",ij);
        for(let ji=i+1;ji<i+ij;ji++){
            orderId[ji].setAttribute("hidden",true);
            orderPay[ji].setAttribute("hidden",true);
            orderAddress[ji].setAttribute("hidden",true);
            orderDeliveryStatus[ji].setAttribute("hidden",true);
            orderWay[ji].setAttribute("hidden",true);
        }
        i=i+ij-1;
        ij=1;
    }
}