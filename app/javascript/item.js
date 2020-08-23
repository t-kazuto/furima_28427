window.addEventListener('load', function(){

  const price = document.getElementById("item-price");
  const fee_field = document.getElementById("add-tax-price");
  const profit_field = document.getElementById("profit")

  price.addEventListener('input', function(){
    let price_value = price.value;
    let fee = price_value / 10;
    fee_field.textContent = fee;
    let profit = price_value - fee;
    profit_field.textContent = profit;
  })
})