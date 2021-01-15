window.addEventListener('load', () => {
  console.log();
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const profits = document.getElementById("profit");
  profits.innerHTML = inputValue * 0.9

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1
  })
  

  
});